import 'dart:convert';
import 'package:ekitaab_pasal/models/category.dart';
import 'package:ekitaab_pasal/screens/cart.dart';
import 'package:ekitaab_pasal/services/catgeory_service.dart';
import 'package:ekitaab_pasal/services/slider_service.dart';
import 'package:ekitaab_pasal/widgets/appdrawer.dart';
import 'package:ekitaab_pasal/widgets/carosuel_slider.dart';
import 'package:ekitaab_pasal/widgets/timeline_browse_catgeories.dart';
import 'package:flutter/material.dart';

class Timeline extends StatefulWidget {
  @override
  _TimelineState createState() => _TimelineState();

}

class _TimelineState extends State<Timeline> {
  SliderService _sliderService=SliderService();
  CategoryService _categoryService=CategoryService();

//declaring instance of catgeory list
  List<Category> _categoryList = List<Category>();

    var items=[];
   // ScrollController _scrollController = ScrollController();
    //int currentPage = 1;
   // bool isCatLoading = true;
    //bool dataAvailable = false;
   // double _maxScroll;
    double deviceHeight;
    double deviceWidth;
    AnimationController controller;
    Animation animation;
    Animation<double> opacityAnimation;
    Animation slideAnimation;
  //  bool visible = false;
  //  int totalCartItems=0;


    @override
    void initState() { 
      super.initState();
      _getAllSliders();
      _getAllCategories();
    }
  _getAllSliders() async {
    var sliders = await _sliderService.getSliders();
    var result = json.decode(sliders.body);
    result['data'].forEach((data) {
      setState(() {
        items.add(NetworkImage(data['image_url']));
      });
    });
    print(result);
  }

  _getAllCategories() async{
    var categories = await _categoryService.getCategories();
    var result = json.decode(categories.body);
    result['data'].forEach((data){
      var model = Category();
      model.id=data['id'];
      model.name=data['categoryName'];
      model.icon=data['categoryIcon'];
      setState(() {
        _categoryList.add(model);
      });
    });
    print(result);
  }

Scaffold buildHomeScreen(){
  return Scaffold(
    appBar: AppBar(
        title: new Text('Home'),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.shopping_cart, color: Colors.white), onPressed:  () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Cart()),
              );
          }),
        ],
        //elevation: defaultTargetPlatform== TargetPlatform.android?5.0:0.0,
        backgroundColor: Colors.green,
       
      ), 
    drawer: AppDrawer(),
    body:   Container(child: ListView(
      children: <Widget>[
        carouselSlider(items),
        Padding(
            padding: EdgeInsets.all(12.0),
            child: Text('Browse Categories', style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold, color: Colors.black),),
          ),
         TimelineBrowseCategories(categoryList: _categoryList,),
      ],
    ),
    
    ),
  );  
}

  @override
  Widget build(BuildContext context) {
    return buildHomeScreen();
        //RefreshIndicator(
        //onRefresh: () => getTimeline(), child: buildTimeline()));
  }
}