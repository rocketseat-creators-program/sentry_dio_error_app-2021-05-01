import 'package:flutter/material.dart';
import 'package:sentry_dio_error_app/pages/layout.dart';

class UsersPage extends StatelessWidget {
  static String tag = '/users';

  @override
  Widget build(BuildContext context) {
    return Layout.render(
      Container(),
      title: 'Users List',
    );
  }
}
