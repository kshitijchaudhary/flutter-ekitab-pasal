import 'package:ekitaab_pasal/widgets/timeline_browse_category.dart';
import 'package:flutter/material.dart';
import 'package:ekitaab_pasal/models/category.dart';

class TimelineBrowseCategories extends StatefulWidget {
  final List<Category> categoryList;
  TimelineBrowseCategories({this.categoryList});

  @override
  _TimelineBrowseCategoriesState createState() => _TimelineBrowseCategoriesState();
}

class _TimelineBrowseCategoriesState extends State<TimelineBrowseCategories> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 205,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: this.widget.categoryList.length,
        itemBuilder: (context, index){
          return TimelineBrowseCategory(this.widget.categoryList[index].icon, this.widget.categoryList[index].name);
        },
      ),
      
    );
  }
}