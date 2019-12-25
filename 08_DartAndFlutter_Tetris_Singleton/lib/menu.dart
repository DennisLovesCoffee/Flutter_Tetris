import 'package:flutter/material.dart';
import 'package:flutter_tetris_app/main.dart';
import 'menuButton.dart';

//TODO new
import 'settings.dart';

class Menu extends StatefulWidget {
  State<StatefulWidget> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  //TODO new
  var settings = Settings();
  GameSpeed currentSpeed = GameSpeed.SPEED_1X;

  void changeGameSpeed() {
    if (currentSpeed == GameSpeed.SPEED_1X) {
      setState(() {
        currentSpeed = GameSpeed.SPEED_2X;
      });
    } else if (currentSpeed == GameSpeed.SPEED_2X) {
      setState(() {
        currentSpeed = GameSpeed.SPEED_3X;
      });
    } else if (currentSpeed == GameSpeed.SPEED_3X) {
      setState(() {
        currentSpeed = GameSpeed.SPEED_1X;
      });
    }
  }

  String getGameSpeed(){
    if(currentSpeed == GameSpeed.SPEED_1X){
      return '1';
    }
    else if(currentSpeed == GameSpeed.SPEED_2X){
      return '2';
    }
    else if(currentSpeed == GameSpeed.SPEED_3X){
      return '3';
    }
  }

  void onPlayClicked() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GameScreen()),
    );
  }

  Widget build(BuildContext context) {
    //TODO NEW
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    settings.setupPlayingField(screenWidth, screenHeight);

    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Tetris',
            style: TextStyle(
                fontSize: 70.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
                shadows: [
                  Shadow(
                    color: Colors.black,
                    blurRadius: 8.0,
                    offset: Offset(2.0, 2.0),
                  )
                ]),
          ),
          MenuButton(onPlayClicked),
          //TODO new
          ButtonTheme(
            height: 40,
            minWidth: 160,
            child: RaisedButton(
              onPressed: () {
                changeGameSpeed();
              },
              color: Colors.white,
              child: Text('Game Speed: x' + getGameSpeed()),
            ),
          ),
        ],
      ),
    );
  }
}
