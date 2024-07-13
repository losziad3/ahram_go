import 'package:ahramgo/data/models/login_model.dart';
import 'package:ahramgo/data/models/register_model.dart';
import 'package:equatable/equatable.dart';

abstract class RegisterState extends Equatable {
  @override
  List<Object> get props => [];
}

class RegisterInitialState extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterSuccessState extends RegisterState {
  final RegisterModel response;

  RegisterSuccessState(this.response);

  @override
  List<Object> get props => [response];
}

class RegisterFailureState extends RegisterState {
  final String error;

  RegisterFailureState(this.error);

  @override
  List<Object> get props => [error];
}

class LoginLoadingState extends RegisterState {}

class LoginSuccessState extends RegisterState {
  final LoginModel response;

  LoginSuccessState(this.response);

  @override
  List<Object> get props => [response];
}

class LoginFailureState extends RegisterState {
  final String error;

  LoginFailureState(this.error);

  @override
  List<Object> get props => [error];
}

