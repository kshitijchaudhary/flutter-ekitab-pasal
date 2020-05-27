import 'package:flutter/material.dart';

class BookDetail extends StatefulWidget {
  final String bookName;
  final String bookPhoto;
  final int rentPrice;
  final String authorName;
  final String bookDescription;

  BookDetail(this.bookName,this.bookPhoto,this.rentPrice,this.authorName,this.bookDescription);
  @override
  _BookDetailState createState() => _BookDetailState();
}

class _BookDetailState extends State<BookDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(this.widget.bookName),
        backgroundColor: Colors.green,
      ),
      body:
      ListView(
        children: <Widget>[
          Container(
            height: 300,
            child: GridTile(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
              child: Container(
                child: Image.network(this.widget.bookPhoto),
              ),
              ),
              footer:Padding(
                padding: const EdgeInsets.only(left: 10.0),
              
               child:Container(
                 child: ListTile(
                   leading: Text(this.widget.bookName),
                  title: Column(
                    children: <Widget>[
                       Text('Rent/Month: ${this.widget.rentPrice}'),
                      Text('Author:${this.widget.authorName}'),
              //         //Text('$this.widget.description}'),
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
               Divider(),
              // ListTile(
              //   title: Text('Book Detail'),
              //    subtitle:Text('Author:${this.widget.authorName}'),
              // //   subtitle: Text('${this.widget.bookDescription}'),
              //  )
            ],
          ),
         
        ],),  
    );
  }
}