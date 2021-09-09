import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:skeleton_text/skeleton_text.dart';

class UserListSkelly extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Expanded(child: 
    ListView(children: [
      Container(
      padding: EdgeInsets.only(left:20, right: 20, top: 20),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: 
        List.filled(20, 0).map((e) => 
        Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: SkeletonAnimation(  
              child: Container(  
              padding: EdgeInsets.only(bottom: 5),
              height: 50,  
              width: MediaQuery.of(context).size.width *0.9,  
              decoration: BoxDecoration(  
                borderRadius: BorderRadius.circular(3.0),  
                color: Colors.grey),  
              ))
          )
        ).toList()
        )
    )]));
  }
}