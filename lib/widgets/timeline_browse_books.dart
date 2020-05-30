import 'package:ekitaab_pasal/widgets/timeline_browse_book.dart';
import 'package:flutter/material.dart';
import 'package:ekitaab_pasal/models/book.dart';

class TimelineBrowseBooks extends StatefulWidget {
  final List<Book> bookList;
  TimelineBrowseBooks({this.bookList});

  @override
  _TimelineBrowseBooksState createState() => _TimelineBrowseBooksState();
}

class _TimelineBrowseBooksState extends State<TimelineBrowseBooks> {
  @override 
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: Row(
        children: <Widget>[
          Expanded(
          child: SizedBox(
            height: 300.0,
       child:ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: this.widget.bookList.length,
        itemBuilder: (context, index){
          return TimelineBrowseBook(this.widget.bookList[index]);
        },
      ),
        
      ),
          ),
        ],
      ),
    );
  }
}