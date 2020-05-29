import 'package:flutter/material.dart';
import 'package:ekitaab_pasal/models/book.dart';
import 'package:ekitaab_pasal/screens/book_detail.dart';

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
      height: 240,
      width: 190,
      child: InkWell(
        onTap: ()
        {
           Navigator.push(context, MaterialPageRoute(builder: (context)=> BookDetail(this.widget.book)));
        },
          child: Card(
          child: Column(
            children: <Widget>[
              Text(this.widget.book.name),
              Image.network(widget.book.photo,width:190,height:120,),
              Column(children: <Widget>[
                Text  ('Rent/Month: रू ${this.widget.book.rentPrice}'),
                Text('Author: ${this.widget.book.authorName}'),
              ],) 

        ],),),
      ),
      
    );
  }
}