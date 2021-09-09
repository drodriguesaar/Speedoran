import 'package:speedoran/style.dart';
import 'package:flutter/cupertino.dart';

class ModeratorsListTitle extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
      child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset('assets/images/supermod.png', width: 30, alignment: Alignment.centerLeft, fit: BoxFit.fitWidth),
        SizedBox(width: 20),
        Text("Moderators", textAlign: TextAlign.left, style: ModeratorNameText)
    ]));
  }
}