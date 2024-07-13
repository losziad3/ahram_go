
import 'package:ahramgo/cubits/auth_cubit/states.dart';
import 'package:ahramgo/data/repository/ahram_go_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AhramGoRepository apiService;

  RegisterCubit(this.apiService) : super(RegisterInitialState());

  Future<void> register(String phone) async {
    try {
      emit(RegisterLoadingState());
      final response = await apiService.registerClient(phone);
      emit(RegisterSuccessState(response));
    } catch (e) {
      emit(RegisterFailureState(e.toString()));
    }
  }

  Future<void> loginOTP(String verificationCode) async {
    // if (registeredPhoneNumber == null) {
    //   emit(LoginFailureState('No phone number registered'));
    //   return;
    // }

    try {
      emit(LoginLoadingState());
      final response = await apiService.loginClient(verificationCode);
      emit(LoginSuccessState(response));
    } catch (e) {
      emit(LoginFailureState(e.toString()));
    }
  }
}
