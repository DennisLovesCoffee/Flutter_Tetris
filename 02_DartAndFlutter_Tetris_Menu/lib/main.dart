import 'package:flutter/material.dart';
import 'menu.dart';
import 'game.dart';

const double WIDTH = 300;
const double HEIGHT = 400;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tetris",
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Menu'),
        centerTitle: true,
      ),
      backgroundColor: Colors.brown[300],
      body: Menu(),
    );
  }
}

class GameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Play'),
      centerTitle: true,),
      backgroundColor: Colors.brown[300],
      body: Game(),
    );
  }
}
