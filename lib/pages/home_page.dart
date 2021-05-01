import 'package:flutter/material.dart';
import 'package:sentry_dio_error_app/pages/layout.dart';
import 'package:sentry_dio_error_app/pages/users/users_page.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class HomePage extends StatefulWidget {
  static String tag = '/home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Sentry.configureScope((scope) {
      scope.user = SentryUser(
        id: '234',
        username: 'Lorivaldo',
      );
    });

    // myPersonalError();

    super.initState();
  }

  Future myPersonalError() async {
    try {
      throw 'My personal error';
    } catch (exception, stackTrace) {
      await Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Center(
          child: Text(
            'This is an App to test errors',
            style: TextStyle(fontSize: Theme.of(context).textTheme.headline4!.fontSize),
          ),
        ),
        SizedBox(height: 40),
        Text(
          'Click below to see a list of users...',
          style: TextStyle(fontSize: Theme.of(context).textTheme.headline5!.fontSize),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(UsersPage.tag);
          },
          child: Text('Users List'),
        )
      ],
    );

    return Layout.render(content);
  }
}
