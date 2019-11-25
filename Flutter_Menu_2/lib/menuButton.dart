import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  Function onClickedFunction;

  MenuButton(this.onClickedFunction);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: 60,
      minWidth: 200,
      child: RaisedButton(
        onPressed: () {
          onClickedFunction();
        },
        color: Colors.red,
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
