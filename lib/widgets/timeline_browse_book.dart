import 'package:flutter/material.dart';

class TimelineBrowseBook extends StatefulWidget {
  final String bookName;
  final String bookPhoto;
  final int rentPrice;
  final String authorName;

  
  TimelineBrowseBook(this.bookName, this.bookPhoto,this.rentPrice,this.authorName);
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
      child: Card(
       child: Column(
          children: <Widget>[
            Text('${this.widget.bookName}'),
            Image.network(widget.bookPhoto, width:190,height:160),
            Column(children: <Widget>[
              //Text('${this.widget.bookName}'),
              Text('Rent/Month: रू ${this.widget.rentPrice}'),   
              Text('Author: ${this.widget.authorName}'),
            ],),
      ],
      ),
      ),
    )
    );
  }
}