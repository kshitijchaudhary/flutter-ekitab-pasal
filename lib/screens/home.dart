import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ekitaab_pasal/login/login.dart';
import 'package:ekitaab_pasal/network_utils/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}
String selectedCategorie="Drama";
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
  }*/
    @override
    Widget build(BuildContext context) {

      var drawerOptions = <Widget>[];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(
        new Column(
          children: <Widget>[
            new ListTile(
              leading: new Icon(
                  d.icon,
                  color: Colors.deepPurple
              ),
              title: new Text(
                  d.title,
                  style: new TextStyle(
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold
                  )),
              selected: i == _selectedIndex,
              onTap: () => _onSelectItem(i),
            ),
            new Divider(
              color: Colors.deepPurple,
              height: 2.0,
            )
          ],
        )
      );
    }
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.drawerItems[_selectedIndex].title),
        elevation: defaultTargetPlatform== TargetPlatform.android?5.0:0.0,
      ),
      body: Center(
      child: _widgetOptions.elementAt(__selectedIndex),
    ),
      
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                accountName: new Text("UserName"),
                accountEmail: new Text("name@example.com"),
              

                
                // phoneNumber: new Text("00000000"),

                currentAccountPicture: new CircleAvatar(
                  maxRadius: 50.0,
                  backgroundColor: Colors.white,
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

            ),
            new Column(
              children: drawerOptions
            ),
             ],
        ),
      ),

   
      bottomNavigationBar: BottomNavigationBar(
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
