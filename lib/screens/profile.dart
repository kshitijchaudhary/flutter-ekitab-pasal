import 'dart:convert';
import 'package:ekitaab_pasal/models/bottom_navigation.dart';
import 'package:ekitaab_pasal/widgets/appdrawer.dart';
import 'package:flutter/foundation.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:mdi/mdi.dart';
import 'package:ekitaab_pasal/models/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:ekitaab_pasal/screens/home.dart';
import 'package:ekitaab_pasal/network_utils/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ekitaab_pasal/screens/cart.dart';

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
 
static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

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

   

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('User Profile'),
        elevation: defaultTargetPlatform== TargetPlatform.android?5.0:0.0,
        backgroundColor: Colors.green,
       
      ),
    drawer: AppDrawer(),
    body:new GestureDetector(
        onTap: () {
        // call this method here to hide soft keyboard
        FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Container( 
        child: new ListView( 
        children: <Widget>[
          new Container(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              
              children: <Widget>[
                  new Container(
                    margin: EdgeInsets.only(top:30),
                    height:500.0,
                    width: 350.0,
                    // child: Card(
                    //   shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(20.0),
                        
                    //   ),
                     // elevation: 10.0,
                      child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: <Widget>[
                         Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: <Widget>[
                             Padding(
                                padding: EdgeInsets.only(left: 20, right:20, top:20),
                                 child: Icon(Mdi.faceProfile, size: 40.0, color: Colors.black),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 30),
                                child: Center(
                                child: Text("User Profile",
                                style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Open-Sans",
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                letterSpacing: 1.5)
                            ),
                           ),
                              ),
                           ],

                           
                          ),

                          // Container(
                          //   padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                          //   child: 
                          //   // Text("Your Name",
                          //   // style: TextStyle(
                          //   //   color: Colors.black,
                          //   //   fontWeight: FontWeight.bold,
                          //   //   fontSize: 12,
                          //   //   ),
                          //   // ),
                            
                            
                          //   TextField(
                          //    keyboardType: TextInputType.text,
                          //     autofocus: false,
                          //     decoration: InputDecoration(
                          //       icon: Icon(Icons.person),
                          //      labelText: "YOUR NAME", 
                          //     prefixText:"KSHITIJ CHAUDHARY",
                          //     ),
                          //   ),
                          // ),
                          // Container(
                          //   padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          //   child: TextField(
                          //     keyboardType: TextInputType.number,
                          //     autofocus: false,
                          //     decoration: InputDecoration(
                          //       icon: Icon(Icons.phonelink_ring),
                          //       labelText: "Your Phone Number",
                          //       prefixText: "+977XXXXXXXXXX",
                          //     ),
                          //   ),
                          // ),
                          // Container(
                          //   padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          //   child: TextField(
                          //     keyboardType: TextInputType.text,
                          //     autofocus: false,
                          //     decoration: InputDecoration(
                          //       icon: Icon(Icons.email),
                          //       labelText: "yourname@example.com",
                          //     ),
                          //   ),
                          // ),
                          // Container(
                          //   padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          //   child: TextField(
                          //     keyboardType: TextInputType.text,
                          //     autofocus: false,
                          //     decoration: InputDecoration(
                          //       icon: Icon(Mdi.mapMarker),
                          //       labelText: "123 Street Kathmandu NP",
                          //     ),
                          //   ),
                          // ),
                          // Container(
                          //   padding: EdgeInsets.only(top:30),
                          //   child: Center(
                          //     child: ButtonTheme(
                          //       minWidth: 90.0,
                          //       height: 40.0,
                          //       child: RaisedButton(
                          //       shape: RoundedRectangleBorder(
                          //         borderRadius: new BorderRadius.circular(30.0),
                          //       ),
                          //       color: Colors.green,
                          //         onPressed: () {},
                          //         child: const Text(
                          //           'Update',
                          //           style: TextStyle(
                          //             fontSize: 20,
                          //             fontFamily: "Open-Sans",
                          //             color: Colors.white
                          //             ),
                                    
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                            
                          // ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(left: 20, right:20, top:20),
                                 child: Icon(Mdi.renameBox, size: 30.0, color: Colors.black),
                              ),
                              Padding(padding: EdgeInsets.only(top:20),
                                child:Text('Kshitij Chaudhary',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Open-Sans",
                                  fontSize: 20,
                                  letterSpacing: 1.0)
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(left: 20, right:20, top:10),
                                 child: Icon(Mdi.phoneRing, size: 30.0, color: Colors.black), 
                                 
                              ),
                              Padding(padding: EdgeInsets.only(top:10),
                                child:Text('+977 98XXXXXXXX',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Open-Sans",
                                  fontSize: 20,
                                  letterSpacing: 1.0)
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(left: 20, right:20, top:10),
                                 child: Icon(Mdi.email, size: 30.0, color: Colors.black),
                              ),
                              Padding(padding: EdgeInsets.only(top:10),
                                child:Text('yourname@example.com',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Open-Sans",
                                  fontSize: 20,
                                  letterSpacing: 1.0)
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(left: 20, right:20, top:10),
                                 child: Icon(Mdi.mapMarker, size: 30.0, color: Colors.black),
                              ),
                              Padding(padding: EdgeInsets.only(top:10),
                                child:Text('123 Street Kathmandu NP',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Open-Sans",
                                  fontSize: 20,
                                  letterSpacing: 1.5)
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.only(top:30),
                            child: Center(
                              child: ButtonTheme(
                                minWidth: 120.0,
                                height: 50.0,
                                child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(30.0),
                                ),
                                color: Colors.green,
                                  onPressed: () {
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(builder: (context) => UpdateProfileCust()), );
                                  },
                                  child: const Text(
                                    'Update Profile',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: "Open-Sans",
                                      color: Colors.white
                                      )
                                    
                                  ),
                                ),
                              ),
                            ),
                            
                          ),
                  
              
              
            
 
                       ], 
                      )
                   // ),
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
