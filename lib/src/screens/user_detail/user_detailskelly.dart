import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:skeleton_text/skeleton_text.dart';
import 'package:speedoran/src/screens/user_detail/user_styles.dart';

class UserDetailSkelly extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20, left: 20),
            child: 
            SkeletonAnimation(  
              child: Container(  
              height: 50,  
              width: MediaQuery.of(context).size.width * 0.9,  
              decoration: BoxDecoration(  
                borderRadius: BorderRadius.circular(3.0),  
                color: Colors.grey),  
          ))),
          Padding(padding: EdgeInsets.only(top: 15, left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              
              SkeletonAnimation(  
                child: Container(  
                height: 50,  
                width: MediaQuery.of(context).size.width * 0.19,  
                decoration: BoxDecoration(  
                  borderRadius: BorderRadius.circular(3.0),  
                  color: Colors.grey)  
              )),
              SizedBox(width:5),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child:
              SkeletonAnimation(  
                child: Container(
                height: 30,  
                width: MediaQuery.of(context).size.width * 0.5,  
                decoration: BoxDecoration(  
                  borderRadius: BorderRadius.circular(3.0),  
                  color: Colors.grey)  
              )))]
          )),
          Padding(padding: EdgeInsets.only(top: 20, left: 20),
            child: Container(
              height: 20,
              child: Row(children:[Text("Social Media",style: LabelsTextStyle)])
            ) 
          ),
          Padding(padding: EdgeInsets.only(top: 20, left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: 
              List.filled(5, 0).map((e) => 
              Padding(
                padding: EdgeInsets.only(right: 20), 
                child: SkeletonAnimation(  
                  child: Container(  
                  height: 40,  
                  width: MediaQuery.of(context).size.width * 0.13,  
                  decoration: BoxDecoration(  
                    borderRadius: BorderRadius.circular(3.0),  
                    color: Colors.grey)  
                )))
              ).toList())),
          Padding(padding: EdgeInsets.only(top: 20, left: 20),
            child: Container(
              height: 20,
              child: Row(children:[Text("Personal Best",style: LabelsTextStyle)])
            ) 
          )
    ]));
  }
}