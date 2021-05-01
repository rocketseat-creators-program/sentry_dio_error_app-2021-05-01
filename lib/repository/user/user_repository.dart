import 'dart:io';

import 'package:sentry_dio_error_app/model/user_model.dart';
import 'package:sentry_dio_error_app/repository/user/user_repository_interface.dart';
import 'package:sentry_dio_error_app/services/api_service.dart';

class UserRepository implements UserRepositoryInterface {
  final _service = ApiService();

  @override
  Future<List<UserModel>> getList() async {
    final result = <UserModel>[];
    try {
      final response = await _service.client.get('/users');

      if (response.statusCode != HttpStatus.ok) {
        throw 'Unexpected result code ${response.statusCode}';
      }

      result.clear();
      for (var user in response.data!) {
        result.add(UserModel.fromJson(user));
      }
    } catch (e, stack) {
      print([e, stack]);
    }
    return result;
  }

  @override
  Future<UserModel> get(int id) async {
    late UserModel user;

    user = UserModel();

    return user;
  }

  @override
  Future<bool> deleteById(int id) async {
    var result = true;

    final response = await _service.client.delete('/users/$id');
    if (response.statusCode != HttpStatus.ok) {
      result = false;
    }
    return result;
  }
}
