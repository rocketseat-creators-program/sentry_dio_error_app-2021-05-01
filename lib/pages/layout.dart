import 'package:flutter/material.dart';

class Layout {
  static Widget render(
    Widget content, {
    String title = 'My App',
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
