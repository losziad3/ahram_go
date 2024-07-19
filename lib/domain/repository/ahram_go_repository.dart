import 'package:ahramgo/data/models/login_model.dart';
import 'package:ahramgo/data/models/register_model.dart';

abstract class AhramGoRepository {
  Future<RegisterModel> registerClient(String phone);
  Future<LoginModel> loginClient(String verificationCode);
}