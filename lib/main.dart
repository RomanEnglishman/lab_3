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

class MyAlertDialogDemo extends StatefulWidget {
  @override
  _MyAlertDialogDemoState createState() => _MyAlertDialogDemoState();
}

class _MyAlertDialogDemoState extends State<MyAlertDialogDemo> {
  String _selectedGender = 'Male';
  bool isLoading = false;
  Widget _buildGenderSelector() {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('Male'),
          leading: Radio<String>(
            value: 'Male',
            groupValue: _selectedGender,
            onChanged: (String? value) {
              setState(() {
                _selectedGender = value!;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Female'),
          leading: Radio<String>(
            value: 'Female',
            groupValue: _selectedGender,
            onChanged: (String? value) {
              setState(() {
                _selectedGender = value!;
              });
            },
          ),
        ),
      ],
    );
  }

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
        body: Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            'Please let us know your gender:',
            style: TextStyle(fontSize: 18.0),
          ),
          _buildGenderSelector(),
          Text(
            'Hello, ${_selectedGender == 'Male' ? 'gentleman' : 'lady'}!',
            style: TextStyle(fontSize: 18.0),
          ),
          // If isLoading is true, show the CircularProgressIndicator
          if (isLoading)
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            ),
          // Show a LinearProgressIndicator under the CircularProgressIndicator
          if (isLoading)
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: LinearProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            ),
        ],
      ),
    ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              isLoading = !isLoading;
            });
          },
          tooltip: 'Download',
          child: Icon(Icons.cloud_download),
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
