import 'package:flutter/material.dart';

class BookHistory extends StatefulWidget {
  @override
  _BookHistoryState createState() => _BookHistoryState();
}

class _BookHistoryState extends State<BookHistory> {
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