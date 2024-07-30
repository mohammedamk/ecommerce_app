import 'package:flutter/material.dart';

TextStyle cardTextStyle = const TextStyle(
    color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500);
TextStyle homeCardTextStyle = const TextStyle(
    color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold);
TextStyle appbarTextStyle = const TextStyle(
    color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500);
TextStyle lineThroughTextStyle = const TextStyle(
    fontSize: 14,
    color: Color(0xff9b9b9b),
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.lineThrough);
TextStyle titleTextStyle = const TextStyle(
    fontSize: 14,
    color: Color(0xffDB3022),
    fontWeight: FontWeight.bold,);
TextStyle semiTitleTextStyle = const TextStyle(
    fontSize: 16,
    color: Colors.black,
    fontWeight: FontWeight.bold);




TextStyle titleLargeTextStyle(
    {Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    TextDecoration? decoration}){
  return  TextStyle(

      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      decoration: decoration

  );
}