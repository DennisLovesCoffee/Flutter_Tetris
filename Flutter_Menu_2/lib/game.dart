import 'package:flutter/material.dart';
import 'main.dart';
import 'actionButton.dart';

enum LastButtonPressed { LEFT, RIGHT, ROTATE, NONE}

class Game extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Game();
}

class _Game extends State<Game> {
  LastButtonPressed performAction = LastButtonPressed.NONE;

  void onActionButtonPressed(LastButtonPressed newAction) {
    setState(() {
      performAction = newAction;
      print("Changing state: " + performAction.toString());
    });
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
              Icon(Icons.rotate_90_degrees_ccw),
              LastButtonPressed.ROTATE,
            )
          ],
        )
      ],
    );
  }
}
