import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:speedoran/style.dart';

class GameTitle extends StatelessWidget {
  final String _title;

  GameTitle(this._title);

  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
              flex: 1,
              fit: FlexFit.loose,
              child: Text(
                this._title,
                textAlign: TextAlign.center,
                style: GridFooterTextStyle,
                
              ))
        ]);
  }
}
