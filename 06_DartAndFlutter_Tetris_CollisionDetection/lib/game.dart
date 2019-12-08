import 'package:flutter/material.dart';
import 'main.dart';
import 'actionButton.dart';
import 'helper.dart';
import 'dart:async';
import 'blocks/block.dart';
import 'blocks/alivePoint.dart';

enum LastButtonPressed { LEFT, RIGHT, ROTATE_LEFT, ROTATE_RIGHT, NONE }
enum MoveDir { LEFT, RIGHT, DOWN }

const int BOARD_WIDTH = 10;
const int BOARD_HEIGHT = 20;

const double WIDTH = 200;
const double HEIGHT = 400;

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
  List<AlivePoint> alivePoints = List<AlivePoint>();

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

  void chechForUserInput() {
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

  void saveOldBlock() {
    currentBlock.points.forEach((point) {
      AlivePoint newPoint = AlivePoint(point.x, point.y, currentBlock.color);
      setState(() {
        alivePoints.add(newPoint);
      });
    });
  }

  bool isAboweOldBlock(){
    bool retVal = false;
    alivePoints.forEach((oldPoint){
      if(oldPoint.checkIfPointsCollide(currentBlock.points)){
        retVal = true;
      }
    });

    return retVal;
  }


  void removeRow(int row){
    setState(() {
      alivePoints.removeWhere((point) => point.y == row);

      alivePoints.forEach((point){
        if(point.y < row){
          point.y += 1;
        }
      });
    });
  }

  void removeFullRows(){
    for(int currentRow = 0; currentRow < BOARD_HEIGHT; currentRow++){
      //loop through all rows (top to bottom)
      int counter = 0;
      alivePoints.forEach((point){
        if(point.y == currentRow){
          counter++;
        }
      });

      if(counter >= BOARD_WIDTH){
        //remove current row
        removeRow(currentRow);
      }
    }
  }

  void onTimeTick(Timer time) {
    if (currentBlock == null) return;

    //remove full rows
    removeFullRows();

    //check if tile is already at the bottom
    if (currentBlock.isAtBottom() || isAboweOldBlock()) {
      //save the block
      saveOldBlock();

      //spawn new block
      setState(() {
        currentBlock = getRandomBlock();
      });
    } else {
      setState(() {
        currentBlock.move(MoveDir.DOWN);
      });
      chechForUserInput();
    }
  }

  Widget drawTetrisBlocks() {
    if (currentBlock == null) return null;

    List<Positioned> visiblePoints = List();

    //currentBlock
    currentBlock.points.forEach((point) {
      visiblePoints.add(
        Positioned(
          child: getTetrisPoint(currentBlock.color),
          left: point.x * POINT_SIZE,
          top: point.y * POINT_SIZE,
        ),
      );
    });

    //old blocks
    alivePoints.forEach((point) {
      visiblePoints.add(
        Positioned(
          child: getTetrisPoint(point.color),
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
