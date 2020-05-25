import 'package:ekitaab_pasal/models/book.dart';
import 'package:ekitaab_pasal/models/notifiers/book_notifier.dart';
import 'package:ekitaab_pasal/widgets/appdrawer.dart';
import 'package:ekitaab_pasal/widgets/buttons/confirm_button.dart';
import 'package:ekitaab_pasal/widgets/input/book_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class AddBookForm extends StatefulWidget {
  final Book book;

  AddBookForm({this.book});

  @override
  _AddBookFormState createState() => _AddBookFormState();
}

class _AddBookFormState extends State<AddBookForm> {
  

  @override
  Widget build(BuildContext context) {
    //var bookNotifier = Provider.of<BookNotifier>(context);
      return Scaffold(
            appBar: AppBar(
              title: Text('Rent Your Book'),
              backgroundColor: Colors.green,
            ),
      drawer: AppDrawer(),
      body: new Center(
          child: new Text("Page not Built Yet "),
      ),
      );
  }
}