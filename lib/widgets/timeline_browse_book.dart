import 'package:flutter/material.dart';
import 'package:ekitaab_pasal/screens/book_detail.dart';
import 'package:ekitaab_pasal/models/book.dart';

class TimelineBrowseBook extends StatefulWidget {
  final Book book;

  
  TimelineBrowseBook(this.book);
  @override
  _TimelineBrowseBookState createState() => _TimelineBrowseBookState();
}

class _TimelineBrowseBookState extends State<TimelineBrowseBook> {
  @override
  Widget build(BuildContext context) {
    
    return SingleChildScrollView(
      child:Container(
      width: 190,
      height: 240,
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> BookDetail(this.widget.book)));
        },
              child: Card(
         child: Column(
            children: <Widget>[
              Text('${this.widget.book.name}'),
              Image.network(widget.book.photo, width:190,height:160),
              Column(children: <Widget>[
                //Text('${this.widget.bookName}'),
                Text('Rent/Month: रू ${this.widget.book.rentPrice}'),
                Text('Author: ${this.widget.book.authorName}'),
              ],),
        ],
        ),
        ),
      ),
    )
    );
  }
}