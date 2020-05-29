// import 'package:ekitaab_pasal/login/login.dart';
// import 'package:flutter/material.dart';
// import 'package:ekitaab_pasal/login/login.dart' show Login;
// import 'package:ekitaab_pasal/widgets/light_color.dart';
// import 'package:ekitaab_pasal/widgets/text_style.dart';
// import 'package:ekitaab_pasal/widgets/extention.dart';

// class SplashPage extends StatefulWidget {
//   SplashPage({Key key}) : super(key: key);

//   @override
//   _SplashPageState createState() => _SplashPageState();
// }

// class _SplashPageState extends State<SplashPage> {
//   @override
//   void initState() {
//      Future.delayed(Duration(seconds: 2)).then((_) {
//       Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Login()));
//     });
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: <Widget>[
//           Container(
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage('assets/logo.png'),
//                 fit: BoxFit.fill,
//               ),
//             ),
//           ),
//           Positioned.fill(
//             child: Opacity(
//               opacity: .6,
//               child: Container(
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                       colors: [LightColor.purpleExtraLight, LightColor.purple],
//                       begin: Alignment.topCenter,
//                       end: Alignment.bottomCenter,
//                       tileMode: TileMode.mirror,
//                       stops: [.5, 6]),
//                 ),
//               ),
//             ),
//           ),
//          Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 Expanded(
//                   flex: 2,
//                   child: SizedBox(),
//                 ),
//                 Image.asset('assets/logo.png', color: Colors.white,height: 100,),
//                 Text(
//                   "e - Kitaab Pasal",
//                   style: TextStyles.h1Style.white,
//                 ),
//                 Text(
//                   "HIRE AND RENT BOOK",
//                   style: TextStyles.bodySm.white.bold,
//                 ),
//                 Expanded(
//                   flex: 7,
//                   child: SizedBox(),
//                 ),
//               ],
//             ).alignTopCenter,
//         ],
//       ),
//     );
//   }
// }


import 'dart:async';

import 'package:ekitaab_pasal/screens/home.dart';
import 'package:ekitaab_pasal/widgets/authentication.dart';
import 'package:flutter/material.dart';
//import 'package:flutkart/utils/flutkart.dart';
//import 'package:flutkart/utils/my_navigator.dart';

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