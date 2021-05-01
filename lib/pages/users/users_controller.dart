import 'dart:async';

import 'package:sentry_dio_error_app/model/user_model.dart';
import 'package:sentry_dio_error_app/repository/user/user_repository.dart';

class UsersController {
  final repository = UserRepository();

  final _controller = StreamController<List<UserModel>>();

  Stream<List<UserModel>> get output => _controller.stream;

  Future<void> getUsersList() async {
    // Fetch users list
    final list = await repository.getList();

    // Add to the stream
    _controller.sink.add(list);
  }

  Future<void> deleteItem(int id) async {
    // if (id % 2 == 0) {
    //   throw 'Forced users list error when user id is even';
    // }

    final result = await repository.deleteById(id);

    if (result) {
      getUsersList();
    }
  }

  dispose() {
    _controller.close();
  }
}
