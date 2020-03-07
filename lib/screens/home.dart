import 'dart:convert';
import 'package:ekitaab_pasal/screens/book_details.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ekitaab_pasal/login/login.dart';
import 'package:ekitaab_pasal/network_utils/api.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:mdi/mdi.dart';
import 'package:ekitaab_pasal/animations/fade_animation.dart';
import 'package:page_transition/page_transition.dart';

import 'package:shared_preferences/shared_preferences.dart';
class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}
String selectedCategorie="All";
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
  List<String> categories = ["All","Recommended","Popular books","My books"];
  int _selectedIndex = 0;
  @override
  void initState(){
   // _loadUserData();
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
     'Index 1: Book',
     style: optionStyle,
  ),
  Text(
     'Index 2: Shopping Cart',
     style: optionStyle,
  ),
  Text(
     'Index 3: Transactions',
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
      Widget image_slider_carousel = Container(
      height: 250,
      child: new Carousel(
        boxFit: BoxFit.fill,
        images: [
          new AssetImage("assets/logo.png"),
          new AssetImage("assets/logo.png"),
          new AssetImage("assets/logo.png"),
          
        ],
      ),
    );
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.drawerItems[_selectedIndex].title),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.notifications, color: Colors.white), onPressed: null),
          
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
                          child:FadeAnimation(1.1,Text('Best Online \nBook Rental System',style:TextStyle(
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
                   child: Row(
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
               height: 280,
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
          icon: Icon(Icons.shopping_basket),
          title: Text('Cart'),
        ),
           BottomNavigationBarItem(
           icon: Icon(Icons.attach_money),
           title: Text('Transactions'),
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
