import 'package:flutter/material.dart';
import 'menu.dart';
import 'game.dart';

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
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios),
          onPressed: () async {
            timer.cancel();
            Navigator.pop(context);
          },
        ),
        title: Text('Play'),
        centerTitle: true,
      ),
      backgroundColor: Colors.brown[300],
      body: Game(),
    );
  }
}
