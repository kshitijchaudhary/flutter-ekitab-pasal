import 'dart:convert';
import 'package:ekitaab_pasal/models/bottom_navigation.dart';
import 'package:flutter/foundation.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:mdi/mdi.dart';
import 'package:ekitaab_pasal/models/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:ekitaab_pasal/login/login.dart';
import 'package:ekitaab_pasal/network_utils/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}
//String selectedCategorie="All";
class UserProfile extends StatefulWidget {
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
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile>{
 // List<String> categories = ["All","Recommended","Popular books","My books"];
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
        
   bottomNavigationBar: MyBottomNavigationBar(),

    body:new GestureDetector(
        onTap: () {
        // call this method here to hide soft keyboard
        FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Container(
        width: screenSize.width,
        child: new ListView( 
        children: <Widget>[
          new Container(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              
              children: <Widget>[
                  new Container(
                    margin: EdgeInsets.only(top:30),
                    height:450.0,
                    width: 350.0,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        
                      ),
                      elevation: 10.0,
                      child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: <Widget>[
                         Container(
                           padding: EdgeInsets.only(top: 30),
                           child: Center(
                           child: Text("Update Profile",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Open-Sans",
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              letterSpacing: 1.5)
                            ),
                           ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                            child: TextField(
                              keyboardType: TextInputType.text,
                              autofocus: false,
                              decoration: InputDecoration(
                                icon: Icon(Icons.person),
                                labelText: "Full Name",
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: TextField(
                              keyboardType: TextInputType.number,
                              autofocus: false,
                              decoration: InputDecoration(
                                icon: Icon(Icons.phonelink_ring),
                                labelText: "Phone Number",
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: TextField(
                              keyboardType: TextInputType.text,
                              autofocus: false,
                              decoration: InputDecoration(
                                icon: Icon(Icons.email),
                                labelText: "Email",
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: TextField(
                              keyboardType: TextInputType.text,
                              autofocus: false,
                              decoration: InputDecoration(
                                icon: Icon(Mdi.mapMarker),
                                labelText: "Address",
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top:30),
                            child: Center(
                              child: ButtonTheme(
                                minWidth: 120.0,
                                height: 55.0,
                                child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(30.0),
                                ),
                                color: Colors.deepPurpleAccent,
                                  onPressed: () {},
                                  child: const Text(
                                    'Update',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: "Open-Sans",
                                      color: Colors.white
                                      ),
                                    
                                  ),
                                ),
                              ),
                            ),
                            
                          ),
                       ], 
                      )
                    ),
                  ),
              ]
              ),
            ),
        ]
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
