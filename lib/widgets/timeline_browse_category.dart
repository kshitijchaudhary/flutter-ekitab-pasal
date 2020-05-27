import 'package:ekitaab_pasal/screens/books_by_category_screen.dart';
import 'package:flutter/material.dart';

class TimelineBrowseCategory extends StatefulWidget {
  final int categoryId;
  final String categoryIcon;
  final String categoryName;
  TimelineBrowseCategory(this.categoryIcon, this.categoryName,this.categoryId);
  @override
  _TimelineBrowseCategoryState createState() => _TimelineBrowseCategoryState();
}

class _TimelineBrowseCategoryState extends State<TimelineBrowseCategory> {
  @override
  Widget build(BuildContext context) {
    
    return Container(
      width: 140,
      height: 190,
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> BooksByCategoryScreen(categoryName: widget.categoryName,categoryId:widget.categoryId)));
        },
              child: Card(
          child: Column(
            children: <Widget>[
              Image.network(widget.categoryIcon, width:190,height:160),
              Padding(padding: const EdgeInsets.all(8.0),
              child: Text(widget.categoryName),
              ),

        ],
        ),
        ),
      ),
    );
  }
}