import 'package:flutter/material.dart';
import 'blocks/block.dart';
import 'blocks/Iblock.dart';
import 'blocks/Jblock.dart';
import 'blocks/Lblock.dart';
import 'blocks/SBlock.dart';
import 'blocks/sqBlock.dart';
import 'blocks/Tblock.dart';
import 'blocks/Zblock.dart';
import 'dart:math';
import 'settings.dart';

Block getRandomBlock() {
  int randomNr = Random().nextInt(7);
  var settings = Settings();

  switch (randomNr) {
    case 0:
      return IBlock(settings.boardWidth);
    case 1:
      return JBlock(settings.boardWidth);
    case 2:
      return LBlock(settings.boardWidth);
    case 3:
      return SBlock(settings.boardWidth);
    case 4:
      return SquareBlock(settings.boardWidth);
    case 5:
      return TBlock(settings.boardWidth);
    case 6:
      return ZBlock(settings.boardWidth);
  }
}

Widget getTetrisPoint(Color color) {
  var settings = Settings();

  return Container(
    width: settings.pointSize,
    height: settings.pointSize,
    decoration: new BoxDecoration(
      color: color,
      shape: BoxShape.rectangle,
    ),
  );
}

Widget getGameOverText(int score) {
  return Center(
    child: Text(
      'Game Over\nEnd Score: $score',
      style: TextStyle(
          fontSize: 35.0,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
          shadows: [
            Shadow(
              color: Colors.black,
              blurRadius: 3.0,
              offset: Offset(2.0, 2.0),
            )
          ]),
    ),
  );
}
