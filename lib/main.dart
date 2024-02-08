// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: MyAlertDialogDemo(),
      ),
    );
  }
}

class Hobby {
  String title;
  bool isChecked;

  Hobby({required this.title, this.isChecked = false});
}

class MyAlertDialogDemo extends StatefulWidget {
  @override
  _MyAlertDialogDemoState createState() => _MyAlertDialogDemoState();
}

class _MyAlertDialogDemoState extends State<MyAlertDialogDemo> {


  Future<void> _showAlertDialog(BuildContext context) async {
    final result = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Election 2020"),
          content: Text("Will you vote for Trump?"),
          actions: [
            ElevatedButton(
              child: Text("Yes"),
              onPressed: () {
                Navigator.of(context).pop("Yes, Of course!"); // Return value
              },
            ),
            ElevatedButton(
              child: Text("No"),
              onPressed: () {
                Navigator.of(context)
                    .pop("No, I will vote for Biden"); // Return value
              },
            ),
          ],
        );
      },
    );

    if (result != null) {
      print("User selected: $result");
    }
  }

  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("My App"),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.directions_transit)),
              Tab(icon: Icon(Icons.directions_bike)),
              Tab(icon: Icon(Icons.directions_boat)),
            ],
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center vertically
            children: [




              
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("Мистер Твистер"),
                accountEmail: Text("home@dartflutter.ru"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(
                    "MT",
                    style: TextStyle(fontSize: 40.0),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.green,
                ),
              ),
              ListTile(
                leading: Icon(Icons.map),
                title: Text('Map'),
                onTap: () {
                  // Navigation logic for Map
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_album),
                title: Text('Album'),
                onTap: () {
                  // Navigation logic for Album
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text('Phone'),
                onTap: () {
                  // Navigation logic for Phone
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.contacts),
                title: Text('Contact'),
                onTap: () {
                  // Navigation logic for Contact
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Setting'),
                onTap: () {
                  // Navigation logic for Setting
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ));
  }
}
