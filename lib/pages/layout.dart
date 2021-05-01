import 'package:flutter/material.dart';

class Layout {
  // This method hold the repetitive layout
  // over all the app.
  static Widget render(
    Widget content, {
    String title = 'RocketSeat Test App',
  }) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: content,
      ),
    );
  }
}
