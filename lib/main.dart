// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(MySnackBarApp());
}

class MySnackBarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SnackBarPage(),
    );
  }
}

class SnackBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter SnackBar Demo'),
        backgroundColor: Colors.green,
      ),
      body: SnackBarDemo(),
    );
  }
}

class SnackBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.amberAccent, // Background color
          onPrimary: Colors.white, // Text color
          padding: EdgeInsets.all(16.0),
          splashFactory: InkRipple.splashFactory,
        ),
        child: Text(
          'Show SnackBar',
          style: TextStyle(fontSize: 25.0),
        ),
        onPressed: () {
          final snackBar = SnackBar(
            content: Text('Hey! This is a SnackBar message.'),
            duration: Duration(seconds: 5),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                // Some code to undo the change.
              },
            ),
          );
          // Use ScaffoldMessenger to show SnackBar
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
      ),
    );
  }
}
