import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sentry_dio_error_app/pages/home_page.dart';
import 'package:sentry_dio_error_app/pages/users/users_page.dart';
import 'package:sentry_dio_error_app/services/custom_navigator_observer.dart';

Future<void> main() async {
  runZonedGuarded(() {
    runApp(MyApp());
  }, (e, stack) {});
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
      navigatorObservers: [
        CustomNavigatorObserver(),
      ],
    );
  }
}
