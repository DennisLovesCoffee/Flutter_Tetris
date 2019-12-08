import 'package:flutter/material.dart';
import 'main.dart';
import 'actionButton.dart';
import 'helper.dart';
import 'dart:async';
import 'blocks/block.dart';

enum LastButtonPressed { LEFT, RIGHT, ROTATE_LEFT, ROTATE_RIGHT, NONE }
enum MoveDir { LEFT, RIGHT, DOWN }

const int BOARD_WIDTH = 10;
const int BOARD_HEIGHT = 20;
const double POINT_SIZE = 20; //size is px

const int GAME_SPEED = 400;
Timer timer;

class Game extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Game();
}

class _Game extends State<Game> {
  LastButtonPressed performAction = LastButtonPressed.NONE;
  Block currentBlock;

  @override
  void initState() {
    super.initState();
    startGame();
  }

  void onActionButtonPressed(LastButtonPressed newAction) {
    setState(() {
      performAction = newAction;
      print("Changing state: " + performAction.toString());
    });
  }

  void startGame() {
    setState(() {
      currentBlock = getRandomBlock();
    });

    timer = new Timer.periodic(
      new Duration(milliseconds: GAME_SPEED),
      onTimeTick,
    );
  }

  void onTimeTick(Timer time) {
    if (currentBlock == null) return;

    setState(() {
      currentBlock.move(MoveDir.DOWN);
    });

    if (performAction != LastButtonPressed.NONE) {
      setState(() {
        switch (performAction) {
          case LastButtonPressed.LEFT:
            currentBlock.move(MoveDir.LEFT);
            break;
          case LastButtonPressed.RIGHT:
            currentBlock.move(MoveDir.RIGHT);
            break;
          case LastButtonPressed.ROTATE_LEFT:
            currentBlock.rotateLeft();
            break;
          case LastButtonPressed.ROTATE_RIGHT:
            currentBlock.rotateRight();
            break;
          default:
            break;
        }

        performAction = LastButtonPressed.NONE;
        
      });
    }
  }

  Widget drawTetrisBlocks() {
    if (currentBlock == null) return null;

    List<Positioned> visiblePoints = List();

    currentBlock.points.forEach((point) {
      visiblePoints.add(
        Positioned(
          child: getTetrisPoint(currentBlock.color),
          left: point.x * POINT_SIZE,
          top: point.y * POINT_SIZE,
        ),
      );
    });
    return Stack(children: visiblePoints);
  }

  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Center(
          child: Container(
            width: WIDTH,
            height: HEIGHT,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: drawTetrisBlocks(),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ActionButton(
              onActionButtonPressed,
              Icon(Icons.arrow_left),
              LastButtonPressed.LEFT,
            ),
            ActionButton(
              onActionButtonPressed,
              Icon(Icons.arrow_right),
              LastButtonPressed.RIGHT,
            ),
            ActionButton(
              onActionButtonPressed,
              Icon(Icons.rotate_left),
              LastButtonPressed.ROTATE_LEFT,
            ),
            ActionButton(
              onActionButtonPressed,
              Icon(Icons.rotate_right),
              LastButtonPressed.ROTATE_RIGHT,
            ),
          ],
        )
      ],
    );
  }
}
