import 'package:ekitaab_pasal/models/book.dart';
import 'package:flutter/material.dart';

class BookDetail extends StatefulWidget {
  final Book book;

  BookDetail(this.book);
  @override
  _BookDetailState createState() => _BookDetailState();
}

class _BookDetailState extends State<BookDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(this.widget.book.name),
        backgroundColor: Colors.green,
      ),
      body:
      ListView(
        children: <Widget>[
          Container(
            height: 350,
            child: GridTile(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 50.0),
              child: Container(
                child: Image.network(this.widget.book.photo),
              ),
              ),
              footer:Padding(
                padding: const EdgeInsets.only(left: 10.0),
              
               child:Container(
                 child: ListTile(
                   leading: Text(this.widget.book.name, style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                  title: Column(
                    children: <Widget>[
                       Text('Rent/Month: ${this.widget.book.rentPrice}',style: TextStyle(color: Colors.redAccent,fontSize: 20,fontWeight: FontWeight.bold),),
                      // Text('Detail ${this.widget.book.bookDetail}'),
                   ],
                   ),
                ),
              ),
               ),
            ),
          ),
          Row(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text('Author:${this.widget.book.authorName}',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                      
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              FlatButton(onPressed: (){
              },
              textColor: Colors.green,
              child: Row(children: <Widget>[
                Text('Add to Cart'),
                IconButton(onPressed: (){

                },
                icon: Icon(Icons.shopping_cart),
                )
              ],
              ),
              ),
              
            ],
          ),
           Divider(),
              ListTile(
                title: Text('Book Detail',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                 //subtitle:Text('Lorem Ipsum'),
                 // subtitle: Text('Detail $this.widget.book.detail}'),
                subtitle: Text(this.widget.book.detail),
               ),       
        ],),  
    );
  }
}