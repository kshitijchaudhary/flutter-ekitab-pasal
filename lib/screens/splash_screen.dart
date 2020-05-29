import 'dart:async';
import 'package:ekitaab_pasal/widgets/authentication.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () => Navigator.push(context, MaterialPageRoute(builder: (context)=> CheckAuthen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.green),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 150.0,
                        child: Image.asset('assets/logo.png',height: 300,),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                     // Image.asset('assets/logo.png',height: 200,),
                      Text(
                        "e-Kitab Pasal",
                   style: TextStyle(color: Colors.white,fontSize: 28),
                 ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                    Text(
                   "Hire and Rent",
                   style: TextStyle(color: Colors.white,fontSize: 25),
                 ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}