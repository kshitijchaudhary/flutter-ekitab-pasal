import 'dart:convert';
import 'package:ekitaab_pasal/screens/addBooks/addBook.dart';
import 'package:ekitaab_pasal/screens/book_details.dart';
import 'package:ekitaab_pasal/animations/fade_animation.dart';
import 'package:ekitaab_pasal/login/login.dart';
import 'package:ekitaab_pasal/network_utils/api.dart';
import 'package:ekitaab_pasal/screens/book_status.dart';
import 'package:ekitaab_pasal/screens/cart.dart';
import 'package:ekitaab_pasal/screens/profile.dart';
import 'package:ekitaab_pasal/screens/timeline.dart';
import 'package:ekitaab_pasal/services/slider_service.dart';
import 'package:ekitaab_pasal/widgets/appdrawer.dart';
import 'package:ekitaab_pasal/widgets/carosuel_slider.dart';

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
    PageController pageController;
    int pageIndex = 0;
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
    bool isHomePageSelected = true;


  //int _selectedIndex = 0;
  @override
  void initState(){
   // _loadUserData();
   //checkCart();
    super.initState();
    pageController = PageController();
   // _getAllSliders();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
  
//Active Page Tabs  

  onPageChanged(int pageIndex) {
    setState(() {
      this.pageIndex = pageIndex;
    });
  }
  onTap(int pageIndex) {
    pageController.jumpToPage(
      pageIndex,
    );
  }
  // _getAllSliders() async{
  //     var sliders = await _sliderService.getSliders();
  //     var encodeFirst = json.encode(sliders.body);
  //     var result= json.decode(encodeFirst);
  //     result['data'].forEach((data){
  //       setState(() {
  //         items.add(NetworkImage(data['image_url']));
  //       });

  //     }
  //     );
  //     print(result);
  //   }
//  Widget childWidget = ChildWidget(
    
//   );
Scaffold buildAuthScreen() {
    return Scaffold(
      drawer: AppDrawer(),
      body: PageView(
        children: <Widget>[
           Timeline(),
           BookStatus(),
           AddBookForm(),
           Cart(),
           UserProfile(),
        ],
        controller: pageController,
        onPageChanged: onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: CupertinoTabBar(
          currentIndex: pageIndex,
          onTap: onTap,
          activeColor: Theme.of(context).primaryColor,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_books),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add_box,
                size: 35.0,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
            ),
          ]),
    );
}
    @override
    Widget build(BuildContext context) {
      // MediaQueryData media = MediaQuery.of(context);

      //  final Size screenSize = media.size;
    
    return  buildAuthScreen();
//     Scaffold(
//      
//       ),   
//          body:   SafeArea(
//           child:SingleChildScrollView(
//           child:Column(
//             children:<Widget>[
//             FadeAnimation(1, Container(
//                 height:300,
//                 width: double.infinity,
//                 padding: EdgeInsets.only(left:25,right:25,top:60),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.only(
//                     bottomRight: Radius.circular(50.0),
//                     bottomLeft: Radius.circular(50.0)
//                     ),
//                     gradient:LinearGradient(
//                       begin:Alignment.topRight,
//                       colors:[
//                         Color.fromRGBO(0, 250, 154, 1),
//                         Color.fromRGBO(0, 128, 128, 1)
//                       ]
//                     ), 
//                     ), 
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: <Widget>[
//                         Expanded(
//                           flex:4,
//                           child:FadeAnimation(1.1,Text('Final Year Project \nBook Rental System',style:TextStyle(
//                             fontSize:25,
//                             fontWeight:FontWeight.bold,
//                             color:Color.fromRGBO(97, 90, 90, 1)
//                           )
//                           ),
//                           ),
//                         ),
//                         Expanded(
//                           flex:3,
//                           child: FadeAnimation(1.2,Image.asset('assets/logo.png')),
//                         ),
//                       ],
//                       ),
//               ),
//               ),
//            Transform.translate(
//              offset:Offset(0,-35),
//             child: FadeAnimation(1.3,Container(
//               height: 60,
//               padding: EdgeInsets.only(left:20, top:8),
//               margin: EdgeInsets.symmetric(horizontal: 25),
//               decoration: BoxDecoration(
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey[350],
//                     blurRadius: 20.0,
//                     offset:Offset(0,10.0)
//                   )
//                 ],
//                 borderRadius: BorderRadius.circular(5.0),
//                 color: Colors.white
//               ),
//               child: TextField(
//                 decoration: InputDecoration(
//                   suffixIcon: Icon(Icons.search,color:Colors.black,size: 20.0,),
//                   border:InputBorder.none,
//                   hintText:'Search'
//                 ),
//               ),
//             )),
//            ),     
//               Padding(
//              padding: EdgeInsets.all(8.0),
//              child: Row(
//                crossAxisAlignment: CrossAxisAlignment.start,
              
//                children: <Widget>[
//                  FadeAnimation(1.2,Text('Browse by Categories',style: TextStyle(
//                    fontWeight: FontWeight.bold,
//                    fontSize: 20,
//                    color:Color.fromRGBO(97, 90, 90, 1)
//                  ),
                 
//                  ),
//                  ), 
//                    Padding(
//                         padding: const EdgeInsets.fromLTRB(100.0, 0, 5.0, 8.0),
//                           child: Container(
//                               decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   borderRadius: BorderRadius.circular(40.0),
//                                   border: Border.all(color: Color(0xFFFF900F))),
//                               child: Padding(
//                                 padding: const EdgeInsets.all(3.0),                
//                                 child: Icon(Icons.arrow_forward_ios,
//                                     ),
//                               ),
//                               )
//                         ),
//                ],
//                ),
             
//             ), 
//              Padding(
//             padding: EdgeInsets.all(8.0),
//               child: Row(crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                Text('CATEGROY')
//               ],)
//               ),    
//             ],   
//           ),
//           ),
//          ),
//     );
    }
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
