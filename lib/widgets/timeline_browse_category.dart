import 'package:flutter/material.dart';

class TimelineBrowseCategory extends StatefulWidget {
  final String categoryIcon;
  final String categoryName;
  TimelineBrowseCategory(this.categoryIcon, this.categoryName);
  @override
  _TimelineBrowseCategoryState createState() => _TimelineBrowseCategoryState();
}

class _TimelineBrowseCategoryState extends State<TimelineBrowseCategory> {
  @override
  Widget build(BuildContext context) {
    
    return Container(
      width: 140,
      height: 190,
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
    );
  }
}