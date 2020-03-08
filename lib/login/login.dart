// import 'package:flutter/scheduler.dart' show timeDilation;

// import 'dart:convert';

// import 'package:ekitaab_pasal/register/register.dart';
// import 'package:ekitaab_pasal/screens/home.dart';
// import 'package:flutter/material.dart';
// import 'package:ekitaab_pasal/network_utils/api.dart';

// import 'package:shared_preferences/shared_preferences.dart';

// //import 'package:ekitaab_pasal/login/login_button.dart';

// class Login extends StatefulWidget {
//   Duration get loginTime => Duration(milliseconds: timeDilation.ceil() * 2250);
//   @override
//   _LoginState createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   bool _isLoading = false;
//   final _formKey = GlobalKey<FormState>();
//   var email;
//   var password;
//   /*final _scaffoldKey = GlobalKey<ScaffoldState>();
//  _showMsg(msg) {
//     final snackBar = SnackBar(
//       content: Text(msg),
//       action: SnackBarAction(
//         label: 'Close',
//         onPressed: () {
//           // Some code to undo the change!
//         },
//       ),
//     );
//     _scaffoldKey.currentState.showSnackBar(snackBar);
//   }*/
//   @override
//   Widget build(BuildContext context) {
//     // Build a Form widget using the _formKey created above.
//     return Scaffold(
      
//      // key: _scaffoldKey,
//       body: Container(
//           color: Colors.teal,
//           child: Stack(
//             children: <Widget>[
//               Positioned(
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       Card(
//                         elevation: 4.0,
//                         color: Colors.white,
//                         margin: EdgeInsets.only(left: 20, right: 20),
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(15)),
//                         child: Padding(
//                           padding: const EdgeInsets.all(10.0),
//                           child: Form(
//                             key: _formKey,
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: <Widget>[
//                                 Padding(padding: EdgeInsets.only(top:20.0)),                              
//                                 TextFormField(
//                                   style: TextStyle(color: Color(0xFF000000)),
//                                   cursorColor: Color(0xFF9b9b9b),
//                                   keyboardType: TextInputType.text,
//                                   decoration: InputDecoration(
//                                   border:OutlineInputBorder(),
//                                     prefixIcon: Icon(
//                                       Icons.email,
//                                       color: Colors.grey,
//                                     ),
//                                     labelText: "Email",
//                                     hintText: "Please enter your Email",
//                                     hintStyle: TextStyle(
//                                         color: Color(0xFF9b9b9b),
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.normal),
//                                   ),
//                                   validator: (emailValue) {
//                                     if (emailValue.isEmpty || !emailValue.contains('@') || !emailValue.endsWith('.com')) {
//                                       return 'Please enter email';
//                                     }
//                                     email = emailValue;
//                                     return null;
//                                   },
//                                 ),
//                                 Padding(padding: EdgeInsets.only(top:20.0)),                              
//                                 TextFormField(
//                                   style: TextStyle(color: Color(0xFF000000)),
//                                   cursorColor: Color(0xFF9b9b9b),
//                                   keyboardType: TextInputType.text,
//                                   obscureText: true,
//                                   decoration: InputDecoration(
//                                   border:OutlineInputBorder(),
//                                     prefixIcon: Icon(
//                                       Icons.lock,
//                                       color: Colors.grey,
//                                     ),
//                                     labelText: "Password",
//                                     hintText: "Enter your Password",
//                                     hintStyle: TextStyle(
//                                         color: Color(0xFF9b9b9b),
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.normal),
//                                   ),
//                                   validator: (passwordValue) {
//                                     if (passwordValue.isEmpty) {
//                                       return 'Please enter some text';
//                                     }
//                                     password = passwordValue;
//                                     return null;
//                                   },
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.all(10.0),
//                                   child: new Column(children: <Widget>[
//                                      FlatButton(
//                                     child: Padding(
//                                       padding: EdgeInsets.only(
//                                           top: 8, bottom: 8, left: 10, right: 10),
//                                       child: Text(
//                                         _isLoading? 'Proccessing...' : 'Login',
//                                         textDirection: TextDirection.ltr,
//                                         style: TextStyle(
//                                           color: Colors.white,
//                                           fontSize: 15.0,
//                                           decoration: TextDecoration.none,
//                                           fontWeight: FontWeight.normal,
//                                         ),
//                                       ),
//                                     ),
                                    
//                                     color: Colors.teal,
//                                     disabledColor: Colors.grey,
//                                     shape: new RoundedRectangleBorder(
//                                         borderRadius:
//                                         new BorderRadius.circular(20.0)),
//                                     onPressed: () {
//                                      // if (_formKey.currentState.validate()) {
//                                        // _login();
//                                      // }
//                                     },
//                                      ),
                                
//                                   ],
//                                   )
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),

//                       Padding(
//                         padding: const EdgeInsets.only(top: 20),
//                         child: InkWell(
//                           onTap: () {
//                             Navigator.push(
//                                 context,
//                                 new MaterialPageRoute(
//                                     builder: (context) => FirstRegister()));
//                           },
//                           child: Text(
//                             'Create new Account',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 15.0,
//                               decoration: TextDecoration.none,
//                               fontWeight: FontWeight.normal,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//     );
//   }
//   /*void _login() async{
//     setState(() {
//       _isLoading = true;
//     });
//     var data = {
//       'email' : email,
//       'password' : password
//     };

//     var res = await Network().authData(data, '/login');
//     var body = json.decode(res.body);
//     if(body['success']){
//       SharedPreferences localStorage = await SharedPreferences.getInstance();
//       localStorage.setString('token', json.encode(body['token']));
//       localStorage.setString('user', json.encode(body['user']));
//       Navigator.push(
//           context,
//           new MaterialPageRoute(
//               builder: (context) => Home()
//           ),
//       );
//     }else{
//       _showMsg(body['message']);
//     }

//     setState(() {
//       _isLoading = false;
//     });

//   }*/
// }

//new
//import 'package:flutter/scheduler.dart' show timeDilation;
//import 'constants.dart';

import 'dart:convert';
//import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ekitaab_pasal/register/register.dart';
//import 'package:ekitaab_pasal/screens/home.dart';
import 'package:flutter/material.dart';
//import 'package:ekitaab_pasal/network_utils/api.dart';

//import 'package:shared_preferences/shared_preferences.dart';

//import 'package:ekitaab_pasal/login/login_button.dart';

class Login extends StatefulWidget {
 // Duration get loginTime => Duration(milliseconds: timeDilation.ceil() * 2250);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  var email;
  var password;
  /*final _scaffoldKey = GlobalKey<ScaffoldState>();
 _showMsg(msg) {
    final snackBar = SnackBar(
      content: Text(msg),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          // Some code to undo the change!
        },
      ),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }*/
  @override
  Widget build(BuildContext context) {
// ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
//     ScreenUtil.instance =
//         ScreenUtil(width: 800, height: 1334, allowFontScaling: true);


    //  final inputBorder = BorderRadius.vertical(
    //   bottom: Radius.circular(10.0),
    //   top: Radius.circular(20.0),
    // );
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      //backgroundColor: Theme.of(context).backgroundColor,
      backgroundColor: Colors.grey,
      resizeToAvoidBottomPadding: false,
     // key: _scaffoldKey,
      body: SingleChildScrollView(
        
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
         
          SizedBox(height: 48),
          Container(
            margin: EdgeInsets.all(5),
            child: Column(
              children: <Widget>[
               //mainAxisAlignment:MainAxisAlignment.center,

                Center(
                 child:RichText(
                   text:TextSpan(
                     style:DefaultTextStyle.of(context).style,
                     children:<TextSpan>[
                       TextSpan(text:'Welcome to ',style: TextStyle(color:Colors.white,fontSize:20.0,fontWeight:FontWeight.normal,
                       decoration: TextDecoration.none,)),
                       TextSpan(text:'E-Kitab ',style: TextStyle(color:Colors.red,fontSize:30.0,fontWeight:FontWeight.bold,
                       decoration: TextDecoration.none)),
                       TextSpan(text:'Pasal ',style: TextStyle(color:Colors.white,fontSize:20.0,fontWeight:FontWeight.normal,    decoration: TextDecoration.none,
                       ))
                       
                     ],
                     
                   ),
                  // 'Log In',
                  // textAlign: TextAlign.center,
                  // style: TextStyle(
                  //   fontSize: 32,
                    
                  //   fontWeight: FontWeight.w500,
                  //   color: Colors.white,
                  //   //color: Theme.of(context).textTheme.title.color,
                  // ),
                ),         
                ),

               
              ],
            ),
          ),
          SizedBox(height: 8),
           Container(
            //margin: EdgeInsets.only(left: 40, top: 30),
            //height: 50,
            alignment: Alignment.topCenter,
            child: Column(
              children: <Widget>[
                Padding(
                padding: EdgeInsets.all(10.0),
                child: Image.asset("assets/logo.png", 
                 width: 150,
                 height: 150,
                //fit:BoxFit.fill
                ),
                
              ),

               // GestureDetector(
                   //child: Image.asset(
                     //'lib/assets/logo.jpg',
                     //fit: BoxFit.fill,
                   //),
                 // onTap: widget.onTapLogo,
                //),
              ],
           ),
          ),
      
      
      
      Container(
          
          
         // color: Colors.teal,
          child: Stack(
            children: <Widget>[
              Positioned(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Card(
                        elevation: 30.0,
                        color: Colors.white,
                        margin: EdgeInsets.only(left: 20, right: 20),
                         shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Center(
                                  child: Text(
                                    'Log In',
                                   textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 25,
                                      
                                      fontWeight: FontWeight.normal,
                                      color: Colors.teal,
                                      //color: Theme.of(context).textTheme.title.color,
                                    ),
                                  ),

                                ),

                                Padding(padding: EdgeInsets.only(top:20.0)),                              
                                TextFormField(
                                  style: TextStyle(color: Color(0xFF000000)),
                                  cursorColor: Color(0xFF9b9b9b),
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                  border:OutlineInputBorder(),
                                    prefixIcon: Icon(
                                      Icons.email,
                                      color: Colors.grey,
                                    ),
                                    labelText: "Email",
                                    hintText: "Please enter your Email",
                                    hintStyle: TextStyle(
                                        color: Color(0xFF9b9b9b),
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  validator: (emailValue) {
                                    if (emailValue.isEmpty || !emailValue.contains('@') || !emailValue.endsWith('.com')) {
                                      return 'Please enter valid email';
                                    }
                                    email = emailValue;
                                    return null;
                                  },
                                ),
                                Padding(padding: EdgeInsets.only(top:20.0)),                              
                                TextFormField(
                                  style: TextStyle(color: Color(0xFF000000)),
                                  cursorColor: Color(0xFF9b9b9b),
                                  keyboardType: TextInputType.text,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                  border:OutlineInputBorder(),
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      color: Colors.grey,
                                    ),
                                    labelText: "Password",
                                    hintText: "Enter your Password",
                                    hintStyle: TextStyle(
                                        color: Color(0xFF9b9b9b),
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  validator: (passwordValue) {
                                    if (passwordValue.isEmpty) {
                                      return 'Password field cannot be empty';
                                    } else if (passwordValue.length < 6) {
                                    return "the password has to be at least 6 characters long";
                                  }
                                    password = passwordValue;
                                    return null;
                                  },
                                ),
                                Padding(

                                //   padding: const EdgeInsets.all(10.0),
                                //   child: new Column(children: <Widget>[
                                //      FlatButton(
                                //     child: Padding(
                                //       padding: EdgeInsets.only(
                                //           top: 8, bottom: 8, left: 10, right: 10),
                                //       child: Text(
                                //         _isLoading? 'Proccessing...' : 'Login',
                                //         textDirection: TextDirection.ltr,
                                //         style: TextStyle(
                                //           color: Colors.white,
                                //           fontSize: 15.0,
                                //           decoration: TextDecoration.none,
                                //           fontWeight: FontWeight.normal,
                                //         ),
                                //       ),
                                //     ),
                                    
                                //     color: Colors.teal,
                                //     disabledColor: Colors.grey,
                                //     shape: new RoundedRectangleBorder(
                                //         borderRadius:
                                //         new BorderRadius.circular(20.0)),
                                //     onPressed: () {
                                //      // if (_formKey.currentState.validate()) {
                                //        // _login();
                                //      // }
                                //     },
                                //      ),
                                
                                //   ],
                                //   )
                                // ),
                              padding:
                              const EdgeInsets.fromLTRB(16.0, 8.0, 14.0, 8.0),
                          child: Material(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.teal,
                              elevation: 0.0,
                              child: MaterialButton(
                                onPressed: () {},
                                minWidth: 150,
                                //minWidth: MediaQuery.of(context).size.width,
                                child: Text(
                                  "Login",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                              )),
                        ),
                          Padding(
                          padding: const EdgeInsets.only(top:20, bottom: 5),
                          child: Text(
                            "Forgot password?",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                              ],
                            ),
                          ),
                        ),
                        
                      ),
                    
                      Padding(

                        padding:
                        const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                        child: Material(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.teal,
                              elevation: 0.0,
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => FirstRegister()));
                          },
                          //minWidth: MediaQuery.of(context).size.width,
                          minWidth: 150,
                          child: Text(
                            'Register Now',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        ],
        ),
      ),
        );
  }
  /*void _login() async{
    setState(() {
      _isLoading = true;
    });
    var data = {
      'email' : email,
      'password' : password
    };

    var res = await Network().authData(data, '/login');
    var body = json.decode(res.body);
    if(body['success']){
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', json.encode(body['token']));
      localStorage.setString('user', json.encode(body['user']));
      Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (context) => Home()
          ),
      );
    }else{
      _showMsg(body['message']);
    }

    setState(() {
      _isLoading = false;
    });

  }*/
}