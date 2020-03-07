//import 'package:ekitaab_pasal/login/login.dart';
import 'package:ekitaab_pasal/login/login.dart';
import 'package:ekitaab_pasal/screens/home.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

//import 'package:ekitaab_pasal/register/register.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
//  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Kitab Pasal',
      // debugShowCheckedModeBanner: false,
       home:CheckAuth(),

      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
        brightness: Brightness.light,
        primaryColor: Colors.cyan[400],
        accentColor: Colors.deepOrange[200],
        // textTheme: TextTheme(
        //   headline: TextStyle(fontSize: 48.0, fontWeight:FontWeight.bold),
        //   title: TextStyle(fontSize: 28.0, fontStyle: FontStyle.italic),
        // body1: TextStyle(fontSize: 18.0))
      ),
      
    );
  }
}
class CheckAuth extends StatefulWidget {
  @override
  _CheckAuthState createState() => _CheckAuthState();
}

class _CheckAuthState extends State<CheckAuth> {
  bool isAuth = false;
  @override
  void initState() {
    _checkIfLoggedIn();
    super.initState();
  }

  void _checkIfLoggedIn() async{
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    if(token != null){
      setState(() {
        isAuth = true;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    Widget child;
    if (isAuth) {
      child = Home();
    } else {
      child = Login();
    }
    return Scaffold(
      body: child,
    );
  }
}

