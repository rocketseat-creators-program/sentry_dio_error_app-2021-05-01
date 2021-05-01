import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sentry_dio_error_app/pages/home_page.dart';
import 'package:sentry_dio_error_app/pages/users/users_page.dart';
import 'package:sentry_dio_error_app/services/custom_navigator_observer.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> main() async {
  runZonedGuarded(() async {
    await SentryFlutter.init(
      (options) {
        options.dsn = 'https://aa633f90fe68471fbb666e645fcc7138@o517786.ingest.sentry.io/5626024';
        // options.environment = 'Production';
      },
      appRunner: () => runApp(MyApp()),
    );
  }, (e, stack) {
    print(['Guarded Error', e]);
  });
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
