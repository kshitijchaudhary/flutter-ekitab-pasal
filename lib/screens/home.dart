import 'dart:convert';
import 'package:ekitaab_pasal/screens/addBooks/addBook.dart';
import 'package:ekitaab_pasal/screens/book_details.dart';
import 'package:ekitaab_pasal/animations/fade_animation.dart';
import 'package:ekitaab_pasal/login/login.dart';
import 'package:ekitaab_pasal/network_utils/api.dart';
import 'package:ekitaab_pasal/screens/book_status.dart';
import 'package:ekitaab_pasal/screens/cart.dart';
import 'package:ekitaab_pasal/screens/profile.dart';
import 'package:ekitaab_pasal/widgets/appdrawer.dart';

import 'package:html/parser.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:mdi/mdi.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:ekitaab_pasal/models/bottom_navigation.dart';
import 'about.dart';
import 'contactus.dart';
import 'faq.dart';



class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}
//String selectedCategorie="All";
class Home extends StatefulWidget {
 
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{
 // List<String> categories = ["All","Recommended","Popular books","My books"];
    //List<Widget> bookShimmer = List();
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
    bool isHomePageSelected = true;


  //int _selectedIndex = 0;
  @override
  void initState(){
   // _loadUserData();
   //checkCart();
    super.initState();
  }
  int currentTab = 0; 
// //static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);


  final List<Widget> screens =
 [
   Home(),
   BookStatus(),
   AddBookForm(),
   Cart(),
   UserProfile(),
 ];

//Active Page Tabs  

void _onItemTapped(int index) {
   setState(() {
     currentTab = index;
   });
 }
    @override
    Widget build(BuildContext context) {
      MediaQueryData media = MediaQuery.of(context);

    //   final Size screenSize = media.size;
    //   var drawerOptions = <Widget>[];
    // for (var i = 0; i < widget.drawerItems.length; i++) {
    //   var d = widget.drawerItems[i];
    //   drawerOptions.add(
    //     new Column(
    //       children: <Widget>[
            
    //         new ListTile(
    //           leading: new Icon(
    //               d.icon,
    //               color: Colors.black
    //           ),
    //           title: new Text(
    //               d.title,
    //               style: new TextStyle(
    //                   color: Colors.black,
    //                   fontWeight: FontWeight.bold
    //               )),
    //           selected: i == _selectedIndex,
    //           onTap: () => _onSelectItem(i),
              
    //         ),
    //         new Divider(
    //           color: Colors.white,
    //           height: 2.0,
    //         )
    //       ],
          
    //     )
    //   );
    // }
    //   Widget image_slider_carousel = Container(
    //   height: 250,
    //   child: new Carousel(
    //     boxFit: BoxFit.fill,
    //     images: [
    //       new AssetImage("assets/logo.png"),
    //       new AssetImage("assets/logo.png"),
    //       new AssetImage("assets/logo.png"),
          
    //     ],
    //   ),
    // );
  //   void onBottomIconPressed(int index) {
  //   if (index == 0 || index == 1) {
  //     setState(() {
  //       isHomePageSelected = true;
  //     });
  //   } else {
  //     setState(() {
  //       isHomePageSelected = false;
  //     });
  //   }
  // }

    return  Scaffold(
      appBar: AppBar(
        title: new Text("Home") ,
        //widget.drawerItems[_selectedIndex].title
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.shopping_cart, color: Colors.white), onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Cart()),
              );
          }),
          
        ],
        elevation: defaultTargetPlatform== TargetPlatform.android?5.0:0.0,
        backgroundColor: Colors.green,
       
      ),
      
      //screens[currentTab],
//CODE FOR FLOATING ACTION BUTTON
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FAQPage()),
              );
          },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

        drawer: AppDrawer(),
//Code for Drawer      
      // drawer: new Drawer(
      //   child: Container(
      //   color:Colors.greenAccent,
      //   child: new ListView(
      //     children: <Widget>[            
      //       new UserAccountsDrawerHeader(              
      //           accountName: new Text("Ekitab Pasal"),
      //           accountEmail: new Text("info@ekitabpasal.com"),                             
      //           // phoneNumber: new Text("00000000"),
      //           currentAccountPicture: new CircleAvatar(
      //             maxRadius: 50.0,
      //             backgroundColor: Colors.red,
      //             // borderRadius: BorderRadius.all(Radius.circular(50.0)),
      //             child: new Text("E"),
      //             /*child: new Center(
                    
      //               child: new Image.asset(
      //                 "assets/madhav.jpg",
      //                 height: 58.0,
      //                 width: 58.0,
      //             ),
      //             )*/
      //            // backgroundImage: new Image.network(src),
      //           ),     
      //           decoration: BoxDecoration(
      //             color:Colors.white
      //             ),           
      //       ),
      //       new Column(
              
      //         children: drawerOptions
      //       ),
      //        ],
      //   ),
      // ),
      // ),
// Drawer Code Ends Here
  
       // bottomNavigationBar: MyBottomNavigationBar(),
         body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[    
        //  Center(
        //         child: screens.elementAt(currentTab),
        //         ),
         SingleChildScrollView(
          
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
           
           
          //  Padding(
          //    padding: EdgeInsets.all(8.0),
          //    child:screens[currentTab] ,
          //  ),
           
           
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
                //  Padding(
                //    padding: EdgeInsets.all(1.0),
                //    child: Text('See All',
                //    style: TextStyle(
                //    fontWeight: FontWeight.bold,
                //    fontSize: 5,
                //    color:Color.fromRGBO(97, 90, 90, 1)
                //  ),
                //    ),                  
                //  ),
                   Padding(
                        padding: const EdgeInsets.fromLTRB(150.0, 0, 8.0, 8.0),
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
             
                        
                      

            //  Expanded(
            //   child: ListView(
            //     scrollDirection: Axis.horizontal,
            //     children: <Widget>[
            //     Container(
            //     color: Colors.amber[600],
            //     child: const Center(child: Text('Entry A')),
            //     )
            //   ],
            //   ), 
            //   ),
        
               ],
               ),
             
            ), 
           
            Padding(
            padding: EdgeInsets.all(8.0),
              child: Row(crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('LIST OF CATEGORIES',style: TextStyle(
                   fontWeight: FontWeight.bold,
                   fontSize: 20,
                   color:Color.fromRGBO(97, 90, 90, 1)
                 ),
                ),
              ],)


              ),    
            ],
            
              
          ),
        
          
          ),
          // Center(
          //       child: screens[currentTab]
          //       ),
          ],
        ),
         ),
    

 bottomNavigationBar: new Theme(
    data: Theme.of(context).copyWith(
        // sets the background color of the `BottomNavigationBar`
        canvasColor: Colors.black,
        // sets the active color of the `BottomNavigationBar` if `Brightness` is light
        primaryColor: Colors.white,
        
        
        textTheme: Theme
            .of(context)
            .textTheme
            .copyWith(caption: new TextStyle(color: Colors.white))), // sets the inactive color of the `BottomNavigationBar`
   
      child: new BottomNavigationBar(
        
          type: BottomNavigationBarType.fixed,
          // onTap: _onItemTapped,
          // currentIndex: currentTab,

      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.library_books),
          title: Text('Your Books'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add),
          title: Text('Rent Books'),
          
        ),
           BottomNavigationBarItem(
           icon: Icon(Icons.notifications),
           title: Text('New Info'),
         ),
           BottomNavigationBarItem(
           icon: Icon(Icons.person_outline),
           title: Text('Profile'),

         ),
      ],
      currentIndex: currentTab,
      selectedItemColor: Colors.greenAccent[800],
      onTap: _onItemTapped,
    ),   //  body: _setDrawerItemWidget(_selectedIndex)
   ), 
    );
    }
    
    

  // _onSelectItem(int index) {
  //   setState(() => _selectedIndex = index);
  //   Navigator.of(context).pop(); //
  // }


}
        // return Scaffold(
        //   appBar: AppBar(
        //     title: Text('E Kitab Pasal'),
        //     backgroundColor: Colors.teal,
        //   ),
        //   body: Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //         children: <Widget>[
        //           Text('Hi, $name',
        //           style: TextStyle(
        //             fontWeight: FontWeight.bold
        //             ),
        //           ),
        //           Center(
        //             child: RaisedButton(
        //               elevation: 10,
        //               onPressed: (){
        //                // logout();
        //               },
        //               color: Colors.teal,
        //               shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
        //               child: Text('Logout'),
        //             ),
        //           ),
        //         ],
        //       ),
        //   ),
        // );
     // }

 /* void logout() async{
    var res = await Network().getData('/logout');
    var body = json.decode(res.body);
    if(body['success']){
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.remove('user');
      localStorage.remove('token');
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context)=>Login()));
    }
  }*/
