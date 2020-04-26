import 'package:flutter/material.dart';
import 'package:ekitaab_pasal/models/bottom_navigation.dart';

class BookStatus extends StatefulWidget {
  @override
  _BookStatusState createState() => _BookStatusState();
}

class _BookStatusState extends State<BookStatus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Book Status"),
      ),
      body: new Center(
        child: new Text("Book Status Page "),
      ),
    );
  }
}