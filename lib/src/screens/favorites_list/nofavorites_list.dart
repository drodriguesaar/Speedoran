import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoFavoritesList extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Column(
        children:[
          Padding(padding: EdgeInsets.all(100),child: Image.asset('assets/images/empty.png')),
          Text("It's very quiet here...",style: Theme.of(context).textTheme.subtitle1)
        ]
      );
  }
}