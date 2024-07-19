import 'package:ahramgo/data/data_source/data_source.dart';
import 'package:ahramgo/data/models/login_model.dart';
import 'package:ahramgo/data/models/register_model.dart';
import 'package:ahramgo/core/local/shared_preferences.dart';
import 'package:ahramgo/domain/repository/ahram_go_repository.dart';

class AhramGoRepositoryImpl implements AhramGoRepository {
  final RemoteDataSource remoteDataSource;

  AhramGoRepositoryImpl({required this.remoteDataSource});

  @override
  Future<RegisterModel> registerClient(String phone) async {
    final registerModel = await remoteDataSource.registerClient(phone);
    await SharedPreferencesHelper.savePhone(phone);
    return registerModel;
  }

  @override
  Future<LoginModel> loginClient(String verificationCode) async {
    final String? savedPhone = await SharedPreferencesHelper.getSavedPhone();

    if (savedPhone == null) {
      throw Exception('No saved phone number found');
    }

    return await remoteDataSource.loginClient(savedPhone, verificationCode);
  }
}
