import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';

class PlatformGamesSkelly extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return 
    Container(
      padding: EdgeInsets.all(25),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: 
        List.filled(20, 0).map((e) => 
        Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: SkeletonAnimation(  
              child: Container(  
              padding: EdgeInsets.only(bottom: 5, left: 5, right: 5),
              height: 60,  
              width: MediaQuery.of(context).size.width *0.9,  
              decoration: BoxDecoration(  
                borderRadius: BorderRadius.circular(3.0),  
                color: Colors.grey
              )))
          )
        ).toList()));
  }
}