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
//import 'package:ekitaab_pasal/models/bottom_navigation.dart';
import 'about.dart';
import 'contactus.dart';
import 'faq.dart';
import 'notifications.dart';



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
 //static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);


  final List<Widget> screens =
 [
   Home(),
   BookStatus(),
   AddBookForm(),
   Cart(),
   UserProfile(),
 ];

//Active Page Tabs  
final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Home();

void _onItemTapped(int index) {
   setState(() {
     currentTab = index;
   });
 }
//  Widget childWidget = ChildWidget(
    
//   );
    @override
    Widget build(BuildContext context) {
      MediaQueryData media = MediaQuery.of(context);

       final Size screenSize = media.size;
    

    return  Scaffold(
        bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Colors.black,
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            Home(); // if user taps on this dashboard tab will be active
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.home,
                          color: currentTab == 0 ? Colors.blueAccent : Colors.white,
                        ),
                        Text(
                          'Home',
                          style: TextStyle(
                            color: currentTab == 0 ? Colors.blueAccent : Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            BookStatus(); // if user taps on this dashboard tab will be active
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.library_books,
                          color: currentTab == 1 ? Colors.blueAccent : Colors.white,
                        ),
                        Text(
                          'Your Books',
                          style: TextStyle(
                            color: currentTab == 1 ? Colors.blueAccent : Colors.white,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),

              // Right Tab bar icons

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            Notifications(); // if user taps on this dashboard tab will be active
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.notifications,
                          color: currentTab == 2 ? Colors.blueAccent : Colors.white,
                        ),
                        Text(
                          'Notifications',
                          style: TextStyle(
                            color: currentTab == 2 ? Colors.blueAccent : Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            UserProfile(); // if user taps on this dashboard tab will be active
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.person_outline,
                          color: currentTab == 3 ? Colors.blueAccent : Colors.white,
                        ),
                        Text(
                          'Profile',
                          style: TextStyle(
                            color: currentTab == 3 ? Colors.blueAccent : Colors.white,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )

            ],
          ),
        ),
      ),
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
        child: Icon(Icons.add,color: Colors.white,),
        backgroundColor: Colors.black,
        onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddBookForm()),
              );
          },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        //FOR APP DRAWER
        drawer: AppDrawer(),
       // bottomNavigationBar: MyBottomNavigationBar(),
         body:   
         SafeArea(
           
        // child: Stack(
        //   fit: StackFit.expand,
          
        //   children: <Widget>[   
          //       PageStorage(
          //   child: currentScreen,
          //   bucket: bucket,
          // ), 
        //  Center(
        //         child: screens.elementAt(currentTab),
        //         ),
        child: 
        //Container(

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
       // ),
          // Center(
          //       child: screens[currentTab]
          //       ),
         // ],
       // ),
       //  ),
  
      // bottomNavigationBar: BottomAppBar(
      //   shape: CircularNotchedRectangle(),
      //   notchMargin: 10,
      //   child: Container(
      //     height: 60,
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: <Widget>[
      //         Row(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: <Widget>[
      //             MaterialButton(
      //               minWidth: 40,
      //               onPressed: () {
      //                 setState(() {
      //                   currentScreen =
      //                       Home(); // if user taps on this dashboard tab will be active
      //                   currentTab = 0;
      //                 });
      //               },
      //               child: Column(
      //                 mainAxisAlignment: MainAxisAlignment.center,
      //                 children: <Widget>[
      //                   Icon(
      //                     Icons.home,
      //                     color: currentTab == 0 ? Colors.green : Colors.black,
      //                   ),
      //                   Text(
      //                     'Home',
      //                     style: TextStyle(
      //                       color: currentTab == 0 ? Colors.green : Colors.black,
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //             MaterialButton(
      //               minWidth: 40,
      //               onPressed: () {
      //                 setState(() {
      //                   currentScreen =
      //                       BookStatus(); // if user taps on this dashboard tab will be active
      //                   currentTab = 1;
      //                 });
      //               },
      //               child: Column(
      //                 mainAxisAlignment: MainAxisAlignment.center,
      //                 children: <Widget>[
      //                   Icon(
      //                     Icons.library_books,
      //                     color: currentTab == 1 ? Colors.green : Colors.black,
      //                   ),
      //                   Text(
      //                     'Your Books',
      //                     style: TextStyle(
      //                       color: currentTab == 1 ? Colors.green : Colors.black,
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             )
      //           ],
      //         ),

      //         // Right Tab bar icons

      //         Row(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: <Widget>[
      //             MaterialButton(
      //               minWidth: 40,
      //               onPressed: () {
      //                 setState(() {
      //                   currentScreen =
      //                       Notifications(); // if user taps on this dashboard tab will be active
      //                   currentTab = 2;
      //                 });
      //               },
      //               child: Column(
      //                 mainAxisAlignment: MainAxisAlignment.center,
      //                 children: <Widget>[
      //                   Icon(
      //                     Icons.notifications,
      //                     color: currentTab == 2 ? Colors.green : Colors.black,
      //                   ),
      //                   Text(
      //                     'Notifications',
      //                     style: TextStyle(
      //                       color: currentTab == 2 ? Colors.green : Colors.black,
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //             MaterialButton(
      //               minWidth: 40,
      //               onPressed: () {
      //                 setState(() {
      //                   currentScreen =
      //                       UserProfile(); // if user taps on this dashboard tab will be active
      //                   currentTab = 3;
      //                 });
      //               },
      //               child: Column(
      //                 mainAxisAlignment: MainAxisAlignment.center,
      //                 children: <Widget>[
      //                   Icon(
      //                     Icons.person_outline,
      //                     color: currentTab == 3 ? Colors.green : Colors.black,
      //                   ),
      //                   Text(
      //                     'Profile',
      //                     style: TextStyle(
      //                       color: currentTab == 3 ? Colors.green : Colors.black,
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             )
      //           ],
      //         )

      //       ],
      //     ),
      //   ),
      // ),





//  bottomNavigationBar: new Theme(
//     data: Theme.of(context).copyWith(
//         // sets the background color of the `BottomNavigationBar`
//         canvasColor: Colors.black,
//         // sets the active color of the `BottomNavigationBar` if `Brightness` is light
//         primaryColor: Colors.white,
        
        
//         textTheme: Theme
//             .of(context)
//             .textTheme
//             .copyWith(caption: new TextStyle(color: Colors.white))), // sets the inactive color of the `BottomNavigationBar`
   
//       child: new BottomNavigationBar(
        
//           type: BottomNavigationBarType.fixed,
//           // onTap: _onItemTapped,
//           // currentIndex: currentTab,

//       items: const <BottomNavigationBarItem>[
//         BottomNavigationBarItem(
//           icon: Icon(Icons.home),
//           title: Text('Home'),
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.library_books, ),
//           title: Text('Your Books',
//           ),
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.add),
//           title: Text('Rent Books'),
          
//         ),
//            BottomNavigationBarItem(
//            icon: Icon(Icons.notifications),
//            title: Text('New Info'),
//          ),
//            BottomNavigationBarItem(
//            icon: Icon(Icons.person_outline),
//            title: Text('Profile'),

//          ),
//       ],
//       currentIndex: currentTab,
//       selectedItemColor: Colors.greenAccent[800],
//       onTap: _onItemTapped,
//     ),   //  body: _setDrawerItemWidget(_selectedIndex)
//    ), 
    )
    );
    
    }
    
    

  // _onSelectItem(int index) {
  //   setState(() => _selectedIndex = index);
  //   Navigator.of(context).pop(); //
  // }


}
      

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
