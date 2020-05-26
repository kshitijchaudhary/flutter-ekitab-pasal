import 'package:flutter/material.dart';

class FAQPage extends StatelessWidget {
  const FAQPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData media = MediaQuery.of(context);
    final Size screenSize = media.size;
    return new Scaffold(
      
      appBar: new AppBar(
        title: new Text("FAQs"),
        backgroundColor: Colors.green,
      ),
      body: new Container(
        width: screenSize.width,
        height: screenSize.height,
        child: new ListView( 
        children: <Widget>[
          new Container(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              
              children: <Widget>[
                  new Container(
                    margin: EdgeInsets.only(top:30),
                    height:400.0,
                    width: 350.0,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 10.0,
                      child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: <Widget>[
                         Container(
                           padding: EdgeInsets.only(top: 30),
                           child: Center(
                           child: Text("Frequently Asked Questions",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Arial, Helvetica",
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              letterSpacing: 1.5)
                            ),
                           ),
                          ),
                          Container(
                           padding: EdgeInsets.fromLTRB(30,20,30,20),
                           child: Text("1. What is this application?",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Arial, Helvetica",
                              fontSize: 12,
                              letterSpacing: 1.0)
                            ),
                           ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
        ),
      ),
    );
  }
}