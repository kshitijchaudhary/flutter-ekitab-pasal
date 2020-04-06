// //import 'package:flutter/scheduler.dart' show timeDilation;
// //import 'constants.dart';

// //import 'dart:convert';

// import 'package:ekitaab_pasal/register/register.dart';
// //import 'package:ekitaab_pasal/screens/home.dart';
// import 'package:flutter/material.dart';
// //import 'package:ekitaab_pasal/network_utils/api.dart';

// //import 'package:shared_preferences/shared_preferences.dart';

// //import 'package:ekitaab_pasal/login/login_button.dart';

// class Login extends StatefulWidget {
//  // Duration get loginTime => Duration(milliseconds: timeDilation.ceil() * 2250);
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

//     //  final inputBorder = BorderRadius.vertical(
//     //   bottom: Radius.circular(10.0),
//     //   top: Radius.circular(20.0),
//     // );
//     // Build a Form widget using the _formKey created above.
//     return Scaffold(
//       backgroundColor: Theme.of(context).backgroundColor,
//       resizeToAvoidBottomPadding: false,
//      // key: _scaffoldKey,
//       body: Column(
//         children: <Widget>[
//           Container(
//             margin: EdgeInsets.only(left: 32, top: 48),
//             height: 50,
//             child: Row(
//               children: <Widget>[
//                 GestureDetector(
//                   // child: Image.asset(
//                   //   'lib/assets/logo.jpg',
//                   //   fit: BoxFit.fill,
//                   // ),
//                  // onTap: widget.onTapLogo,
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 48),
//           Container(
//             margin: EdgeInsets.only(left: 32),
//             child: Row(
//               children: <Widget>[
//                 Text(
//                   'Login',
//                   style: TextStyle(
//                     fontSize: 32,
//                     fontWeight: FontWeight.w500,
//                     color: Theme.of(context).textTheme.title.color,
//                   ),
//                 )
//               ],
//             ),
//           ),
//           SizedBox(height: 8),
      
      
      
//       Container(
          
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
//                                       return 'Please enter valid email';
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
//         ],
//         ),
//         );
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