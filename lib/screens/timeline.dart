import 'package:ekitaab_pasal/animations/fade_animation.dart';
import 'package:ekitaab_pasal/services/slider_service.dart';
import 'package:ekitaab_pasal/widgets/appdrawer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'cart.dart';

class Timeline extends StatefulWidget {
  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  SliderService _sliderService=SliderService();
    var items=[];
    ScrollController _scrollController = ScrollController();
    int currentPage = 1;
    bool isCatLoading = true;
    bool dataAvailable = false;
    double _maxScroll;
    double deviceHeight;
    double deviceWidth;
    AnimationController controller;
    Animation animation;
    Animation<double> opacityAnimation;
    Animation slideAnimation;
    bool visible = false;
    int totalCartItems=0;
    List cartItems=[];
    List bannerImage = ['assets/images/group.jfif','assets/images/allbooks.jfif',
    'assets/images/chair.jfif'];


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
        elevation: defaultTargetPlatform== TargetPlatform.android?5.0:0.0,
        backgroundColor: Colors.green,
       
      ),
    drawer: AppDrawer(),
    body:   SafeArea(
          child:SingleChildScrollView(
          child:Column(
            children:<Widget>[
            FadeAnimation(1, Container(
                height:300,
                width: double.infinity,
                padding: EdgeInsets.only(left:25,right:25,top:60),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(50.0),
                    bottomLeft: Radius.circular(50.0)
                    ),
                    gradient:LinearGradient(
                      begin:Alignment.topRight,
                      colors:[
                        Color.fromRGBO(0, 250, 154, 1),
                        Color.fromRGBO(0, 128, 128, 1)
                      ]
                    ), 
                    ), 
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          flex:4,
                          child:FadeAnimation(1.1,Text('Final Year Project \nBook Rental System',style:TextStyle(
                            fontSize:25,
                            fontWeight:FontWeight.bold,
                            color:Color.fromRGBO(97, 90, 90, 1)
                          )
                          ),
                          ),
                        ),
                        Expanded(
                          flex:3,
                          child: FadeAnimation(1.2,Image.asset('assets/logo.png')),
                        ),
                      ],
                      ),
              ),
              ),
           Transform.translate(
             offset:Offset(0,-35),
            child: FadeAnimation(1.3,Container(
              height: 60,
              padding: EdgeInsets.only(left:20, top:8),
              margin: EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[350],
                    blurRadius: 20.0,
                    offset:Offset(0,10.0)
                  )
                ],
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.white
              ),
              child: TextField(
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.search,color:Colors.black,size: 20.0,),
                  border:InputBorder.none,
                  hintText:'Search'
                ),
              ),
            )),
           ),     
              Padding(
             padding: EdgeInsets.all(8.0),
             child: Row(
               crossAxisAlignment: CrossAxisAlignment.start,
              
               children: <Widget>[
                 FadeAnimation(1.2,Text('Browse by Categories',style: TextStyle(
                   fontWeight: FontWeight.bold,
                   fontSize: 20,
                   color:Color.fromRGBO(97, 90, 90, 1)
                 ),
                 
                 ),
                 ), 
                   Padding(
                        padding: const EdgeInsets.fromLTRB(100.0, 0, 5.0, 8.0),
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(40.0),
                                  border: Border.all(color: Color(0xFFFF900F))),
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),                
                                child: Icon(Icons.arrow_forward_ios,
                                    ),
                              ),
                              )
                        ),
               ],
               ),
             
            ), 
             Padding(
            padding: EdgeInsets.all(8.0),
              child: Row(crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
               Text('CATEGROY')
              ],)
              ),    
            ],   
          ),
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