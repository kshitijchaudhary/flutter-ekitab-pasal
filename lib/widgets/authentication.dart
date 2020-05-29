import 'package:flutter/material.dart';
import 'package:ekitaab_pasal/login/login.dart';
import 'package:ekitaab_pasal/screens/home.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckAuthen extends StatefulWidget {
  @override
  _CheckAuthenState createState() => _CheckAuthenState();
}

class _CheckAuthenState extends State<CheckAuthen> {
  bool isAuth = true;
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