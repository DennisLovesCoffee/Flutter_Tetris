import 'point.dart';
import 'package:flutter/material.dart';

class AlivePoint extends Point{
  //int x; -> defint Point class
  //int y; -> defint Point class
  
  Color color;

  AlivePoint(int x, int y, Color col) : super(x,y){
    color = col;
  }

  //AlivePoint(int x, int y, this.color) : super(x,y);

}