import 'package:flutter/material.dart';
import 'package:sentry_dio_error_app/pages/layout.dart';
import 'package:sentry_dio_error_app/pages/users_page.dart';

class HomePage extends StatefulWidget {
  static String tag = '/home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        FlatButton(
          onPressed: () {
            Navigator.of(context).pushNamed(UsersPage.tag);
          },
          color: Colors.blue,
          textColor: Colors.white,
          child: Text('Users List'),
        )
      ],
    );

    return Layout.render(content);
  }
}
