import 'package:flutter/material.dart';

final vHintTextStyle = TextStyle(
  color: Colors.white54,
  fontFamily: 'Montsterrat',
  
);

final vLabelStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontFamily: 'Montsterrat',
  color: Colors.white54
);

final gLabelStyle = TextStyle(
  fontFamily: "Montsterrat",
  fontWeight: FontWeight.bold,
  fontSize: 20.0,
  color: Colors.blue[200],
  
  
);

final vBoxDecorationStyle = BoxDecoration(
  color: Colors.white54,
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);
final textTheme= TextTheme(
          headline: TextStyle(fontSize: 48.0, fontWeight:FontWeight.bold),
          title: TextStyle(fontSize: 28.0, fontStyle: FontStyle.italic),
        body1: TextStyle(fontSize: 18.0));