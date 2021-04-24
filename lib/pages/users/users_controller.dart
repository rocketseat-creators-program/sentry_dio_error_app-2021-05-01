import 'dart:async';

import 'package:sentry_dio_error_app/model/user_model.dart';
import 'package:sentry_dio_error_app/repository/user/user_repository.dart';

class UsersController {
  final repository = UserRepository();

  final _controller = StreamController<List<UserModel>>();

  Stream<List<UserModel>> get output => _controller.stream;

  getUsersList() async {
    final list = await repository.getList();
    _controller.sink.add(list);
  }

  deleteItem(int id) async {
    final result = await repository.deleteById(id);

    if (result) {
      getUsersList();
    }
  }

  dispose() {
    _controller.close();
  }
}
