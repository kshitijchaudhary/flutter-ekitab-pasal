import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

Widget carouselSlider(items) => SizedBox(
  height: 200,
  child: Carousel(
    boxFit: BoxFit.cover,
    images: items,
    autoplay: true,
    animationCurve: Curves.fastOutSlowIn,
    animationDuration: Duration(milliseconds: 1000),
  ),
);