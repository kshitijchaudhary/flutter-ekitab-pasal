import 'dart:convert';

import 'package:ekitaab_pasal/login/login.dart';
import 'package:ekitaab_pasal/network_utils/api.dart';
import 'package:ekitaab_pasal/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class FirstRegister extends StatefulWidget{
  @override
  FirstRegisterState createState() => FirstRegisterState(); 
}

class FirstRegisterState extends State<FirstRegister>{
bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  var name;
  var email;
  var phone;
  var address;
  var password;
@override
Widget build(BuildContext context){
  return Material(
    child:Container(
        color: Colors.teal,
        child: Stack(
          children: <Widget>[
    // appBar: AppBar(
    //   title: Text('Register' ),
    //   centerTitle: true,
    //   backgroundColor: Colors.deepOrange,
      
    // ), children: <Widget>[
            Positioned(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Card(
                      elevation: 4.0,
                      color: Colors.white,
                      margin: EdgeInsets.only(left: 20, right: 20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[

                              Padding(padding: EdgeInsets.only(top:20.0)),                              
                              TextFormField(
                                style: TextStyle(color: Color(0xFF000000)),
                                cursorColor: Color(0xFF9b9b9b),                               
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  border:OutlineInputBorder(),
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color: Colors.grey,
                                  ),
                                  labelText: 'Full Name',
                                  hintText: "Please Enter your Full Name",
                                  hintStyle: TextStyle(
                                      color: Color(0xFF9b9b9b),
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                ),
                                validator: (nameValue) {
                                  if (nameValue.isEmpty) {
                                    return 'Please enter your name';
                                  }
                                  name = nameValue;
                                  return null;
                                },
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
                                  labelText: 'Email',
                                  hintText: "Enter your valid Email",
                                  hintStyle: TextStyle(
                                      color: Color(0xFF9b9b9b),
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                ),
                                validator: (emailValue) {
                                  if (emailValue.isEmpty) {
                                    return 'Please enter your first name';
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
                                decoration: InputDecoration(
                                border:OutlineInputBorder(),
                                  prefixIcon: Icon(
                                    Icons.phone,
                                    color: Colors.grey,
                                  ),
                                  labelText: 'Phone Number',
                                  hintText: "Enter your Phone Number",
                                  hintStyle: TextStyle(
                                      color: Color(0xFF9b9b9b),
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                ),
                                validator: (phoneNumber) {
                                  if (phoneNumber.isEmpty) {
                                    return 'Please enter your Contact Number';
                                  }
                                  phone = phoneNumber;
                                  return null;
                                },
                              ),
                              Padding(padding: EdgeInsets.only(top:20.0)),
                              TextFormField(                                
                                style: TextStyle(color: Color(0xFF000000)),
                                cursorColor: Color(0xFF9b9b9b),
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                border:OutlineInputBorder(),
                                  prefixIcon: Icon(
                                    Icons.place,
                                    color: Colors.grey,
                                  ),
                                  labelText: 'Address',
                                  hintText: "Enter your Address",
                                  hintStyle: TextStyle(
                                      color: Color(0xFF9b9b9b),
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                ),
                                validator: (addressValue) {
                                  if (addressValue.isEmpty) {
                                    return 'Please enter your Address';
                                  }
                                  address = addressValue;
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
                                  labelText: 'Password',
                                  hintText: "Set Your Password",
                                  hintStyle: TextStyle(
                                      color: Color(0xFF9b9b9b),
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                ),
                                validator: (passwordValue) {
                                  if (passwordValue.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                  password = passwordValue;
                                  return null;
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: FlatButton(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: 8, bottom: 8, left: 10, right: 10),
                                    child: Text(
                                      _isLoading? 'Proccessing...' : 'Register',
                                      textDirection: TextDirection.ltr,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.0,
                                        decoration: TextDecoration.none,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                  color: Colors.teal,
                                  disabledColor: Colors.grey,
                                  shape: new RoundedRectangleBorder(
                                      borderRadius:
                                      new BorderRadius.circular(20.0)),
                                  onPressed: () {
                                    if (_formKey.currentState.validate()) {
                                        _register();
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => Login()));
                        },
                        child: Text(
                          'Already Have an Account',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.normal,
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
    );
  }
  void _register()async{
    setState(() {
      _isLoading = true;
    });
    var data = {
      'name': name,
      'email' : email,
      'password': password,
      'phone': phone,
      'address': address
    };

    var res = await Network().authData(data, '/register');
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
    }

    setState(() {
      _isLoading = false;
    });
  }
}
