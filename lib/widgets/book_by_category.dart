import 'package:flutter/material.dart';
import 'package:ekitaab_pasal/models/book.dart';

class BookByCategory extends StatefulWidget {
  final Book book;
  BookByCategory(this.book);
  @override
  _BookByCategoryState createState() => _BookByCategoryState();
}

class _BookByCategoryState extends State<BookByCategory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 190,
      child: Card(
        child: Column(
          children: <Widget>[
            Text(this.widget.book.name),
            Image.network(widget.book.photo,width:190,height:140,),
            Column(children: <Widget>[
              Text  ('Rent per month:${this.widget.book.rentPrice}'),
              Text('Author: ${this.widget.book.authorName}'),
            ],) 

      ],),),
      
    );
  }
}