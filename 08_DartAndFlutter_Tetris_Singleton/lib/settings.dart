import 'dart:async';

enum LastButtonPressed { LEFT, RIGHT, ROTATE_LEFT, ROTATE_RIGHT, NONE }
enum MoveDir { LEFT, RIGHT, DOWN }
enum GameSpeed { SPEED_1X, SPEED_2X, SPEED_3X }

class Settings {
  static final Settings _instance = Settings._internal();
  int gameSpeed; //can change during the game
  int boardWidth;
  int boardHeight;
  double pointSize; //calculate out relative to boardWidth, height
  double pixelWidth;
  double pixelHeight; //has to be 2 x width
  Timer timer;
  bool _hasBeenCalculated = false;

  factory Settings() {
    return _instance;
  }

  Settings._internal() {
    gameSpeed = 400;
    boardWidth = 10;
    boardHeight = 20;
    pointSize = 20;
    pixelWidth = 200;
    pixelHeight = 400;
  }

  void setupPlayingField(double screenWidth, double screenHeight) {
    if(_hasBeenCalculated == true) return;

    _hasBeenCalculated = true;
    double userInputSize = 250.0;
    double newHeight = screenHeight - userInputSize;
    double newWidth = newHeight / 2.0;

    pixelHeight = newHeight;
    pixelWidth = newWidth;
    pointSize = pixelWidth / boardWidth;
    print('calculated -> new height: $pixelHeight and new width: $pixelWidth and point size: $pointSize');
  }

  void changeGameSpeed(GameSpeed newSpeed) {
    if(newSpeed == GameSpeed.SPEED_1X){
      gameSpeed = 400;
    }
    else if(newSpeed == GameSpeed.SPEED_2X){
      gameSpeed = 300;
    }
    else if(newSpeed == GameSpeed.SPEED_3X){
      gameSpeed = 200;
    }
  }
}
