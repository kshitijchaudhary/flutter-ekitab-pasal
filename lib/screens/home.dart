import 'dart:convert';
import 'package:ekitaab_pasal/screens/book_details.dart';
import 'package:ekitaab_pasal/animations/fade_animation.dart';
import 'package:ekitaab_pasal/login/login.dart';
import 'package:ekitaab_pasal/network_utils/api.dart';

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



class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}
//String selectedCategorie="All";
class Home extends StatefulWidget {
  final drawerItems = [
    new DrawerItem("Home", Icons.home),
    new DrawerItem("Notifications", Icons.notifications),
    new DrawerItem("Profile", Icons.person),
    new DrawerItem("Contact Us", Icons.contact_mail),
    // new DrawerItem("Setting", Icons.settings),
    new DrawerItem("FAQs", Icons.question_answer),
    new DrawerItem("About App", Icons.library_books),
    new DrawerItem("Log Out", Icons.close),
    
    
  ];

  /*final bottomNavItems = [
    new bottomNavItems("Home", Icons.home),
    new bottomNavItems("Books", Icons.library_books),
    new bottomNavItems("Cart", Icons.shopping_basket),
    new bottomNavItems("Transactions", Icons.monetization_on),
    new bottomNavItems("User Profile", Icons.person),
  ];*/

 
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{
 // List<String> categories = ["All","Recommended","Popular books","My books"];
    List<Widget> bookShimmer = List();
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


  int _selectedIndex = 0;
  @override
  void initState(){
   // _loadUserData();
   //checkCart();
    super.initState();
  }
 int __selectedIndex = 0; 
static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

static const List<Widget> _widgetOptions = <Widget>[
  Text(
    'Index 0: Home',
    style: optionStyle,
  ),
  Text(
     'Index 1: Book Status',
     style: optionStyle,
  ),
  Text(
     'Index 2: Rent Books',
     style: optionStyle,
  ),
  Text(
     'Index 3: History',
     style: optionStyle,
  ),
  Text(
     'Index 4: Profile',
     style: optionStyle,
  ),
  
];

void _onItemTapped(int index) {
  setState(() {
    __selectedIndex = index;
  });
}
  /*_loadUserData() async{
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = jsonDecode(localStorage.getString('user'));

    if(user != null) {
      setState(() {
        name = user['name'];
      });
    }
  }*/ //child:_widgetOptions.elementAt(__selectedIndex,
    @override
    Widget build(BuildContext context) {
      MediaQueryData media = MediaQuery.of(context);

      final Size screenSize = media.size;
      var drawerOptions = <Widget>[];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(
        new Column(
          children: <Widget>[
            
            new ListTile(
              leading: new Icon(
                  d.icon,
                  color: Colors.black
              ),
              title: new Text(
                  d.title,
                  style: new TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  )),
              selected: i == _selectedIndex,
              onTap: () => _onSelectItem(i),
              
            ),
            new Divider(
              color: Colors.white,
              height: 2.0,
            )
          ],
          
        )
      );
    }
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
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.drawerItems[_selectedIndex].title),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.shopping_cart, color: Colors.white), onPressed: null),
          
        ],
        elevation: defaultTargetPlatform== TargetPlatform.android?5.0:0.0,
        backgroundColor: Colors.green,
       
      ),
     
        
        
        
        
      
    
      
      drawer: new Drawer(
        child: Container(
        color:Colors.greenAccent,
        child: new ListView(
          children: <Widget>[
            
            new UserAccountsDrawerHeader(
              
                accountName: new Text("UserName"),
                accountEmail: new Text("name@example.com"),                             
                // phoneNumber: new Text("00000000"),

                currentAccountPicture: new CircleAvatar(
                  maxRadius: 50.0,
                  backgroundColor: Colors.red,
                  // borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  child: new Text("U"),
                  /*child: new Center(
                    
                    child: new Image.asset(
                      "assets/madhav.jpg",
                      height: 58.0,
                      width: 58.0,
                  ),
                  )*/
                 // backgroundImage: new Image.network(src),
                ),     
                decoration: BoxDecoration(
                  color:Colors.white
                  ),           
            ),
            new Column(
              
              children: drawerOptions
            ),
             ],
        ),
      ),
      ),


        body: SingleChildScrollView(
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
                        Color.fromRGBO(255, 250, 182, 1),
                        Color.fromRGBO(255, 239, 78, 1)
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
              )),
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
             padding: EdgeInsets.all(25),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: <Widget>[
                 FadeAnimation(1.2,Text('Choose \na category',style: TextStyle(
                   fontWeight: FontWeight.bold,
                   fontSize: 20,
                   color:Color.fromRGBO(97, 90, 90, 1)
                 )),
                 ),
                 
                 
                 Container(
                   child: new Wrap(
                    //spacing: 8.0, // gap between adjacent chips
                   // runSpacing: 4.0,
                    direction: Axis.horizontal, // main axis (rows or columns)

                     //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: <Widget>[
                       FadeAnimation(1.2,FlatButton(
                         shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                         padding: EdgeInsets.all(5),
                         onPressed: (){},
                         color:Color.fromRGBO(251, 53, 105, 0.1),
                         child: Text('Text Books',style: TextStyle(
                           color: Color.fromRGBO(251, 53, 105, 1),
                           fontSize: 16,
                           fontWeight: FontWeight.bold
                           ),
                           ),
                       )),
                       SizedBox(width: 20.0,),
                       FadeAnimation(1.3,FlatButton(
                         shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                         padding: EdgeInsets.all(10),
                         onPressed: (){},
                         color:Color.fromRGBO(97, 90, 90, 0.1),
                         child: Text('Crime and Detective',style: TextStyle(
                           color: Color.fromRGBO(97, 90, 90, 0.6),
                           fontSize: 16,
                           fontWeight: FontWeight.bold
                           ),
                           ),
                       )),
                       
                       SizedBox(width: 20.0,),
                       FadeAnimation(1.3,FlatButton(
                         shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                         padding: EdgeInsets.all(10),
                         onPressed: (){},
                         color:Color.fromRGBO(97, 90, 90, 0.1),
                         child: Text('Cosmic and Graphic Novel',style: TextStyle(
                           color: Color.fromRGBO(97, 90, 90, 0.6),
                           fontSize: 16,
                           fontWeight: FontWeight.bold
                           ),
                           ),
                       )),
                     ],
                   ),
                 )
                 








               ],
             ),
           ),
           SizedBox(
             height: 30,),

 Container(
               height: 200,
               width: double.infinity,
               child:ListView(
                 padding: EdgeInsets.only(bottom:20,left:20),
                 scrollDirection: Axis.horizontal,
                 children: <Widget>[
                  FadeAnimation(1.3, makeCard(
                     context:context,
                     startColor:Color.fromRGBO(251, 121, 155, 1),
                     endColor: Color.fromRGBO(251, 53, 105, 1),
                     image: 'assets/logo.png'
                   
                   )),
                   FadeAnimation(1.4,makeCard(
                     context:context,
                     startColor:Color.fromRGBO(203, 251, 255, 1),
                     endColor: Color.fromRGBO(81, 223, 234, 1),
                     image: 'assets/logo.png'
                   
                   )),
                     FadeAnimation(1.4,makeCard(
                     context:context,
                     startColor:Color.fromRGBO(208, 90, 294, 1),
                     endColor: Color.fromRGBO(23, 21, 80, 1),
                     image: 'assets/logo.png'
                   
                   )),
                 ],
               ),
               ),
              

              
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
      currentIndex: __selectedIndex,
      selectedItemColor: Colors.greenAccent[800],
      onTap: _onItemTapped,
    ),

       
    
    //  body: _setDrawerItemWidget(_selectedIndex)
   ),
  //  floatingActionButton: Container(
  //       width: 65.0,
  //       height: 65.0,
  //       decoration: BoxDecoration(
  //           color: Color(0xFFfa7b58),
  //           shape: BoxShape.circle,
  //           boxShadow: [
  //             BoxShadow(
  //                 color: Color(0xFFf78a6c).withOpacity(.6),
  //                 offset: Offset(0.0, 10.0),
  //                 blurRadius: 10.0)
  //           ]),
  //       child: RawMaterialButton(
  //         shape: CircleBorder(),
  //         child: Icon(
  //           Icons.add,
  //           size: 35.0,
  //           color: Colors.white,
  //         ),
  //         onPressed: () {},
  //       ),
  //     ),
  //     floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
    }
    
    Widget customSlider(BuildContext context) {
    return Swiper(
      
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 200.0,
            decoration: BoxDecoration(
                color: Colors.indigo,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(bannerImage[index])
                ),
                borderRadius: BorderRadius.circular(20.0)),
          ),
        );
      },
      itemCount: bannerImage.length,
      viewportFraction: 0.8,
      autoplay: true,
    );
  }

  Widget homeBuild(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      top: true,
      bottom: true,
      child: Stack(
        children: <Widget>[
          CustomScrollView(
            controller: _scrollController,
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildListDelegate([
                  Container(height: 200.0, child: customSlider(context)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            'Browse By Categories',
                            style: TextStyle(
                                fontSize: (deviceHeight / 100) + 10,
                                color: Color(0xFFFF900F),
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50.0),
                                  border: Border.all(color: Color(0xFFFF900F))),
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Icon(Icons.arrow_forward_ios,
                                    size: (deviceHeight / 100) + 5),
                              )),
                        )
                      ],
                    ),
                  ),
                  FutureBuilder(
                    //future: cats,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Container(
                          height: (deviceHeight + 370) * 0.1,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data.length,
                            itemExtent: (deviceHeight + 190) * 0.1,
                            itemBuilder: (context, i) {
                              return Column(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 4.0, right: 4.0),
                                    child: GestureDetector(
                                      child: Hero(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(90.0),
                                              border: Border.all(
                                                  color: Colors.white),
                                              color: Colors.transparent),
                                          height: deviceHeight * 0.1,
                                          width: deviceHeight * 0.1,
                                          child: ClipRRect(
                                            child: FadeInImage.assetNetwork(
                                              placeholder:
                                                  'assets/images/placeholder.png',
                                              image: (snapshot.data[i].image !=
                                                      null)
                                                  ? snapshot.data[i].image.src
                                                  : 'assets/images/loginbg.png',
                                              fit: BoxFit.fill,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(90.0),
                                          ),
                                        ),
                                        tag: snapshot.data[i].id.toString(),
                                      ),
                                      onTap: () {
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             CategoryScreen(
                                        //               id: snapshot.data[i].id,
                                        //               imgSrc: (snapshot.data[i]
                                        //                           .image !=
                                        //                       null)
                                        /*                   ? snapshot*/
                                        //                       .data[i].image.src
                                        //                   : 'assets/images/loginbg.png',
                                        //               categoryName:
                                        //                   snapshot.data[i].name,
                                        //             )));
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      child: Text(
                                        snapshot.data[i].name,
                                        maxLines: 1,
                                        softWrap: false,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      width: 90.0,
                                    ),
                                  )
                                ],
                              );
                            },
                          ),
                        );
                      } else {
                        return Column(
                          children: <Widget>[
                            Container(
                              height: (deviceHeight + 370) * 0.1,
                              child: ListView.builder(
                                  itemCount: 10,
                                  itemExtent: (deviceHeight + 190) * 0.1,
                                  scrollDirection: Axis.horizontal,
                                  // Important code
                                  itemBuilder: (context, index) =>
                                      Shimmer.fromColors(
                                        baseColor: Colors.grey[400],
                                        highlightColor: Colors.white,
                                        child: Column(
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 4.0, right: 4.0),
                                              child: Container(
                                                  height: deviceHeight * 0.1,
                                                  width: deviceHeight * 0.1,
                                                  decoration: BoxDecoration(
                                                    color: Colors.black26,
                                                    boxShadow: [BoxShadow()],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            90.0),
                                                  )),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                height: 10,
                                                width: 90.0,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      )),
                            ),
                          ],
                        );
                      }
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            'Listing Popular Rentals',
                            style: TextStyle(
                                fontSize: (deviceHeight / 100) + 10,
                                color: Color(0xFFFF900F),
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 8.0),
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50.0),
                                  border: Border.all(color: Color(0xFFFF900F))),
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Icon(Icons.arrow_forward_ios,
                                    size: (deviceHeight / 100) + 5),
                              )),
                        )
                      ],
                    ),
                  ),
                ]
                ),
            ),
              // (productsList == null)
              //     ? SliverGrid.count(
              //         crossAxisCount: 3,
              //         childAspectRatio: deviceHeight / (deviceHeight + 600),
              //         mainAxisSpacing: 1.0,
              //         crossAxisSpacing: 1.0,
              //         children: bookShimmer.map((item) {
              //           return item;
              //         }).toList())
              //     : SliverGrid.count(
              //         crossAxisCount: 3,
              //         mainAxisSpacing: 1.0,
              //         crossAxisSpacing: 1.0,
              //         childAspectRatio: deviceHeight / (deviceHeight + 600),
              //         children: productsList.map((item) {
              //           return Column(
              //             children: <Widget>[
              //               GestureDetector(
              //                 onTap: () {
              //                   Navigator.push(
              //                       context,
              //                       MaterialPageRoute(
              //                           builder: (context) => DetailPage(
              //                               id: item.id,
              //                               bookAttributes: item.attri,
              //                               avgRating: double.parse(
              //                                   item.averageRating),
              //                               sortDec: parse(item.sortDescription)
              //                                   .body
              //                                   .text,
              //                               purchaseNote:
              //                                   parse(item.purchaseNote)
              //                                       .body
              //                                       .text,
              //                               bookName: item.name,
              //                               bookDescription: item.description,
              //                               bookImage: item.images[0].src,
              //                               priceHtml: item.priceHtml)));
              //                 },
              //                 child: Column(
              //                   children: <Widget>[
              //                     Stack(
              //                       children: <Widget>[
              //                         Container(
              //                           height: (deviceHeight / 10) + 100,
              //                           child: Padding(
              //                             padding: const EdgeInsets.all(8.0),
              //                             child: Hero(
              //                               tag: item.id,
              //                               child: Stack(
              //                                 children: <Widget>[
              //                                   Container(
              //                                     height:
              //                                         (deviceHeight / 10) + 100,
              //                                     child: ClipRRect(
              //                                       child: FadeInImage
              //                                           .assetNetwork(
              //                                         placeholder:
              //                                             'res/images/placeholder.png',
              //                                         image: item.images[0].src,
              //                                         width:
              //                                             (deviceHeight / 10) +
              //                                                 70,
              //                                         fit: BoxFit.fill,
              //                                       ),
              //                                       borderRadius:
              //                                           BorderRadius.circular(
              //                                               10.0),
              //                                     ),
              //                                     decoration: BoxDecoration(
              //                                       color: Colors.white,
              //                                       boxShadow: [
              //                                         BoxShadow(
              //                                           color: Colors.black45,
              //                                           offset:
              //                                               Offset(1.0, 1.0),
              //                                           blurRadius: 4.0,
              //                                         )
              //                                       ],
              //                                       borderRadius:
              //                                           BorderRadius.circular(
              //                                               15.0),
              //                                     ),
              //                                   )
              //                                   /*  Container(
              //                                     width: (deviceHeight / 10) + 70,
              //                                     decoration:   BoxDecoration(
              //                                         color: Colors.black26,
              //                                         boxShadow: [
              //                                             BoxShadow(
              //                                             color: Colors.black45,
              //                                             offset:
              //                                                   Offset(1.0, 1.0),
              //                                             blurRadius: 4.0,
              //                                           )
              //                                         ],
              //                                         borderRadius:
              //                                               BorderRadius.circular(
              //                                                 15.0),
              //                                         image:   DecorationImage(
              //                                             fit: BoxFit.cover,
              //                                             image:   NetworkImage(
              //                                                 item.images[0].src))),
              //                                   ),*/
              //                                 ],
              //                               ),
              //                             ),
              //                           ),
              //                         ),
              //                       ],
              //                     ),
              //                     Padding(
              //                       padding: const EdgeInsets.symmetric(
              //                           horizontal: 10.0),
              //                       child: Container(
              //                           child: Text(
              //                         item.name,
              //                         maxLines: 1,
              //                         softWrap: false,
              //                         overflow: TextOverflow.ellipsis,
              //                         style: TextStyle(
              //                             fontWeight: FontWeight.w400,
              //                             fontSize: 16.0),
              //                       )),
              //                     ),
              //                     Padding(
              //                       padding: const EdgeInsets.symmetric(
              //                           horizontal: 10.0),
              //                       child: Container(
              //                           width: 140.0,
              //                           child: Text(
              //                             item.priceHtml,
              //                             maxLines: 1,
              //                             softWrap: false,
              //                             overflow: TextOverflow.ellipsis,
              //                             style: TextStyle(
              //                                 color: Colors.black87,
              //                                 fontWeight: FontWeight.bold,
              //                                 fontSize: 13.0,
              //                                 fontStyle: FontStyle.normal),
              //                           )),
              //                     ),
              //                   ],
              //                 ),
              //               )
              //             ],
              //           );
                    //  }).toList(),
                   // ),
              SliverList(
                delegate: SliverChildListDelegate([
                  (dataAvailable)
                      ? Container(
                          height: 50.0,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CupertinoActivityIndicator(),
                          ))
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Text('No More Books To Display'),
                            )
                          ],
                        )
                ]),
              )
            ],
          ),
         // headerbuilder(context),
        ],
      ),
    );
  }

  Widget makeCard({context,startColor,endColor,image}){
    return GestureDetector(
      onTap: (){
        Navigator.push(context, PageTransition(type:PageTransitionType.fade,child:BookDetails()));
      },
      child: AspectRatio(
        aspectRatio: 4/5,
        child: Container(
          margin: EdgeInsets.only(right:20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13.0),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              colors: [
                startColor,
                endColor
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[350],
                blurRadius: 10,
                offset: Offset(5,10)
              ),
            ]
          ),
          child:Padding(
            padding: EdgeInsets.all(50),
            child:Center(
              child: Image.asset(image),
            ),
          ),
        ),
      ),
    );
  }

    


  /*_setDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new HomeFragment();
      case 1:
        return new AboutUs();
      case 2:
        return new OurMission();
      case 3:
        return new OurVision();
      case 4:
        return new ContactUs();
      case 5:
        return new PrivacyPolicy();
      case 6:
        return new RateUs();
      case 7:
        return new AboutApp();

      default:
        return new Text("Error");
    }
  }*/

  _onSelectItem(int index) {
    setState(() => _selectedIndex = index);
    Navigator.of(context).pop(); //
  }


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
