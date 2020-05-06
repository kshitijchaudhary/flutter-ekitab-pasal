import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: new AppBar(
        title: new Text("Settings"),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.shopping_cart, color: Colors.white), onPressed: null),
          
        ],
        backgroundColor: Colors.green,
      ),
      body: new Center(
        child: new Text("Page not Built Yet "),
      ),
    );
      
  }
}