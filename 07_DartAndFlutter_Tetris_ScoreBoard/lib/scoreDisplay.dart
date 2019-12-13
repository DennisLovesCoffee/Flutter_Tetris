import 'package:flutter/material.dart';

class ScoreDisplay extends StatelessWidget {
  final int score;
  ScoreDisplay(this.score);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100,
        height: 100,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(width: 1.0, color: Colors.blue),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(
          "Score\n$score",
          textAlign: TextAlign.center,
          style: (TextStyle(
            color: Colors.white,
          )),
        ));
  }
}
