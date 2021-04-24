import 'package:sentry_dio_error_app/model/user_model.dart';

abstract class UserRepositoryInterface {
  Future<List<UserModel>> getList();

  Future<UserModel> get(int id);

  Future<bool> deleteById(int id);
}
