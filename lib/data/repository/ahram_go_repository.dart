import 'dart:convert';
import 'package:ahramgo/core/constants/api_constant.dart';
import 'package:ahramgo/data/models/login_model.dart';
import 'package:ahramgo/data/models/register_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AhramGoRepository {
  final Dio _dio = Dio();

  Future<RegisterModel> registerClient(String phone) async {
    const url = BASEURL + REGISTER;

    try {
      final response = await _dio.post(
        url,
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
        data: jsonEncode({'phone': phone}),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        await _savePhone(phone);
        return RegisterModel.fromJson(response.data);
      } else {
        throw Exception('Failed to register client');
      }
    } on DioException catch (e) {
      throw Exception('Failed to register client: ${e.message}');
    }
  }

  Future<LoginModel> loginClient(String verificationCode) async {
    const url = BASEURL + LOGIN;
    final String? savedPhone = await _getSavedPhone();

    if (savedPhone == null) {
      throw Exception('No saved phone number found');
    }

    try {
      final response = await _dio.post(
        url,
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
        data: jsonEncode({'phone': savedPhone, 'verificationCode': verificationCode}),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return LoginModel.fromJson(response.data);
      } else {
        throw Exception('Failed to login client');
      }
    } on DioException catch (e) {
      throw Exception('Failed to login client: ${e.message}');
    }
  }

  Future<void> _savePhone(String phone) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('savedPhone', phone);
  }

  Future<String?> _getSavedPhone() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('savedPhone');
  }
}