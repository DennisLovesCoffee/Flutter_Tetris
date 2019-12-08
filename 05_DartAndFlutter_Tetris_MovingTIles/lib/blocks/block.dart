import 'point.dart';
import 'package:flutter/material.dart';
import '../game.dart';

class Block {
  List<Point> points = List<Point>(4);
  Point rotationCenter;
  Color color;

  void move(MoveDir dir) {
    switch (dir) {
      case MoveDir.LEFT:
        points.forEach((p) => p.x -= 1);
        break;
      case MoveDir.RIGHT:
        points.forEach((p) => p.x += 1);
        break;
      case MoveDir.DOWN:
        points.forEach((p) => p.y += 1);
        break;
    }
  }

  void rotateRight() {
    points.forEach((point){
      int x = point.x;
      point.x = rotationCenter.x - point.y + rotationCenter.y;
      point.y = rotationCenter.y + x - rotationCenter.x;
    });
  }

  void rotateLeft() {
    points.forEach((point){
      int x = point.x;
      point.x = rotationCenter.x + point.y - rotationCenter.y;
      point.y = rotationCenter.y - x + rotationCenter.x;
    });
  }

  bool isAtBottom(){
    int lowestPoint = 0;

    points.forEach((point){
      if(point.y > lowestPoint){
        lowestPoint = point.y;
      }
    });

    if(lowestPoint >= BOARD_HEIGHT - 1){
      return true;
    }
    else{
      return false;
    }

    //return lowestPoint >= BOARD_HEIGHT - 1;
  }

}
