import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:gradient_text/gradient_text.dart';
import 'package:speedoran/src/utils/videoicon.dart';
import 'package:speedoran/src/utils/countryflags.dart';
import 'package:speedoran/src/viewmodels/userviewmodel.dart';
import 'package:speedoran/src/screens/user_detail/user_styles.dart';
import 'package:speedoran/src/screens/user_detail/user_detailskelly.dart';

class UserDetailFull extends StatelessWidget{
  final UserViewModel user;
  UserDetailFull(this.user);

   void openRunUrl(String uri){
    if(uri.isEmpty){
      return;
    }
    canLaunch(uri).then((value) => launch(uri));
  }

  Widget getUserSkelly(){
    return UserDetailSkelly();
  }

  @override
  Widget build(BuildContext context){

    if(user==null){
      return getUserSkelly();
    }

    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20, left: 20),
            child: Container(  
              height: 50,  
              width: MediaQuery.of(context).size.width * 0.9,  
              child: Flexible(child: 
              GradientText(user.name,gradient: user.nameColor,style: UserNameTextStyle)
              )  
            )
          ),
          Padding(padding: EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(  
                  padding: EdgeInsets.only(left:20),
                  width: MediaQuery.of(context).size.width * 0.2,  
                  child: Image.asset(CountryFlags.getFlag(user.country), width: MediaQuery.of(context).size.width * 0.1, fit: BoxFit.fitWidth),
                ),
                Container(  
                  padding: EdgeInsets.only(left:10),
                  height: 30,  
                  width: MediaQuery.of(context).size.width * 0.5,  
                  child: Text(user.country,style: UserCountryTextStyle, textAlign: TextAlign.left),  
                )]
          )),
          Padding(padding: EdgeInsets.only(top: 20, left: 20),
            child: Container(
              height: 20,
              child: Row(children:[Text("Social Media:",style: LabelsTextStyle)])) 
          ),
          Padding(padding: EdgeInsets.only(top: 10, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: user.socialMedia.values.where((element)=> element != null).isEmpty ?
                <Widget>[Padding(
                  padding: EdgeInsets.only(left:10),
                  child: Text("No social media...", style: TextStyle(color: Colors.white, height: 2)))] :
                user.socialMedia.values.where((element)=> element != null).map((e) => Container(
                  child: IconButton(
                    icon: VideoIcon.getIcon(e),
                    onPressed: () { 
                      openRunUrl(e);
                    },
                  ))).toList())),
          Padding(padding: EdgeInsets.only(top: 10, left: 20),
            child: Container(
              height: 20,
              child: Row(children:[Text("Personal Best:",style: LabelsTextStyle)])
            ))
    ]));
  }
}