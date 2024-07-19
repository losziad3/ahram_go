import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ahramgo/core/constants/api_constant.dart';
import 'package:ahramgo/data/models/login_model.dart';
import 'package:ahramgo/data/models/register_model.dart';

abstract class RemoteDataSource {
  Future<RegisterModel> registerClient(String phone);
  Future<LoginModel> loginClient(String phone, String verificationCode);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final Dio dio;

  RemoteDataSourceImpl({required this.dio});

  @override
  Future<RegisterModel> registerClient(String phone) async {
    const url = BASEURL + REGISTER;

    try {
      final response = await dio.post(
        url,
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
        data: jsonEncode({'phone': phone}),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return RegisterModel.fromJson(response.data);
      } else {
        throw Exception('Failed to register client');
      }
    } on DioException catch (e) {
      throw Exception('Failed to register client: ${e.message}');
    }
  }

  @override
  Future<LoginModel> loginClient(String phone, String verificationCode) async {
    const url = BASEURL + LOGIN;

    try {
      final response = await dio.post(
        url,
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
        data: jsonEncode({'phone': phone, 'verificationCode': verificationCode}),
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
}
