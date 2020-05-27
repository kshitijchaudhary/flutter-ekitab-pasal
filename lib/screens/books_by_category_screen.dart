import 'dart:convert';

import 'package:ekitaab_pasal/models/book.dart';
import 'package:ekitaab_pasal/services/book_service.dart';
import 'package:ekitaab_pasal/widgets/book_by_category.dart';
import 'package:flutter/material.dart';

class BooksByCategoryScreen extends StatefulWidget {
  final String categoryName;
  final int categoryId;
  BooksByCategoryScreen({this.categoryName,this.categoryId});
  @override
  _BooksByCategoryScreenState createState() => _BooksByCategoryScreenState();
}

class _BooksByCategoryScreenState extends State<BooksByCategoryScreen> {

  BookService _bookService=BookService();

  List<Book> _bookListByCategory=List<Book>();

  _getBookByCategory() async{
    var books= await _bookService.getBooksByCategoryId(this.widget.categoryId);
    var _list= json.decode(books.body);
    _list['data'].forEach((data){
      var model=Book();
      model.id=data['id'];  
      model.name=data['bookName'];
      model.authorName=data['authorName'];
      model.rentPrice=data['rentPrice'];
      model.photo=data['bookPhoto'];
      model.description=data['bookDescription'];

      setState(() {
        _bookListByCategory.add(model);
      });
    });

    
    }
    @override
    void initState() { 
      super.initState();
      _getBookByCategory();

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(this.widget.categoryName),
        backgroundColor: Colors.green,
    ),
    
    body: Container(
      child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      scrollDirection: Axis.vertical,
        shrinkWrap: true,
       itemCount: _bookListByCategory.length,
       itemBuilder: (context, index){
         return BookByCategory(this._bookListByCategory[index]);

       }),  
      ),

    );
  }
}