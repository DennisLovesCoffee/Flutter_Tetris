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
        if (canMoveToSide(-1)) {
          points.forEach((p) => p.x -= 1);
        }
        break;
      case MoveDir.RIGHT:
        if (canMoveToSide(1)) {
          points.forEach((p) => p.x += 1);
        }

        break;
      case MoveDir.DOWN:
        points.forEach((p) => p.y += 1);
        break;
    }
  }

  bool canMoveToSide(int moveAmt) {
    bool retVal = true;

    points.forEach((point) {
      if (point.x + moveAmt < 0 || point.x + moveAmt >= BOARD_WIDTH) {
        retVal = false;
      }
    });

    return retVal;
  }

  bool allPointsInside(){
    bool retVal = true;

    points.forEach((point){
      if(point.x < 0 || point.x >= BOARD_WIDTH){
        retVal = false;
      }
    });

    return retVal;
  }

  void rotateRight() {
    points.forEach((point) {
      int x = point.x;
      point.x = rotationCenter.x - point.y + rotationCenter.y;
      point.y = rotationCenter.y + x - rotationCenter.x;
    });

    if(allPointsInside() == false){
      rotateLeft();
    }
  }

  void rotateLeft() {
    points.forEach((point) {
      int x = point.x;
      point.x = rotationCenter.x + point.y - rotationCenter.y;
      point.y = rotationCenter.y - x + rotationCenter.x;
    });

    if(allPointsInside() == false){
      rotateRight();
    }
  }

  bool isAtBottom() {
    int lowestPoint = 0;

    points.forEach((point) {
      if (point.y > lowestPoint) {
        lowestPoint = point.y;
      }
    });

    if (lowestPoint >= BOARD_HEIGHT - 1) {
      return true;
    } else {
      return false;
    }

    //return lowestPoint >= BOARD_HEIGHT - 1;
  }
}
