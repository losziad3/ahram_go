import 'dart:convert';

import 'package:ahramgo/cubits/auth_cubit/states.dart';
import 'package:ahramgo/domain/repository/ahram_go_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AhramGoRepository apiService;

  RegisterCubit(this.apiService) : super(RegisterInitialState());

  // // Registers a new user using the provided phone number
  // Future<void> register(String phone) async {
  //   try {
  //     emit(RegisterLoadingState());
  //     final response = await apiService.registerClient(phone);
  //     emit(RegisterSuccessState(response));
  //   } catch (e) {
  //     emit(RegisterFailureState('Failed to register: ${e.toString()}'));
  //   }
  // }

  // Logs in the user using the provided verification code

  Future<void> register(String phone) async {
    try {
      emit(RegisterLoadingState());
      final response = await apiService.registerClient(phone);
      emit(RegisterSuccessState(response));
    } catch (e) {
      String errorMessage = 'Failed to register';
      if (e is DioException) {
        try {
          final errorResponse = e.response!.data;
          if (errorResponse['errors'] != null && errorResponse['errors'].isNotEmpty) {
            errorMessage = errorResponse['errors'][0]['msg'];
          }
        } catch (parseError) {
          // Handle JSON parse error
        }
      }
      emit(RegisterFailureState(errorMessage));
    }
  }
  Future<void> loginOTP(String verificationCode) async {
    try {
      emit(LoginLoadingState());
      final response = await apiService.loginClient(verificationCode);
      emit(LoginSuccessState(response));
    } catch (e) {
      emit(LoginFailureState('Failed to login: ${e.toString()}'));
    }
  }
}
