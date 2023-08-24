import 'package:flutter/material.dart';
import 'dart:math';

int notes = 0;
int notenumber = 0;
String userid = "";

List color = [Colors.green, Colors.blue, Colors.yellow, Colors.purple, Colors.brown, Colors.blueAccent];

randomcolorselection(){
  var range = Random();
   return color[range.nextInt(color.length)];
}