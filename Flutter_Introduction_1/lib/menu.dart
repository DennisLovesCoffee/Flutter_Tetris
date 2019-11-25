import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  State<StatefulWidget> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              print("pressed Play");
            },
            color: Colors.red,
            child: Icon(Icons.play_arrow),
          ),
          RaisedButton(
            onPressed: () {
              print("pressed Play2");
            },
            color: Colors.red,
            child: Icon(Icons.play_circle_outline),
          )
        ],
      ),
    );
  }
}
