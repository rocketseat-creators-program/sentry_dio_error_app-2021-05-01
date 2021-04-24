import 'package:flutter/material.dart';
import 'package:sentry_dio_error_app/pages/home_page.dart';
import 'package:sentry_dio_error_app/pages/users/users_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: {
        UsersPage.tag: (_) => UsersPage(),
      },
    );
  }
}
