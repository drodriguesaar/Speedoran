import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gradient_text/gradient_text.dart';
import 'package:speedoran/src/utils/videoicon.dart';
import 'package:speedoran/src/utils/countryflags.dart';
import 'package:speedoran/src/viewmodels/userviewmodel.dart';
import 'package:speedoran/src/screens/user_detail/user_detail.dart';

class UserListItem extends StatelessWidget {
  final UserViewModel userVM;

  UserListItem(this.userVM);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){

        Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 500),
              transitionsBuilder: (context,animation,animationTime,child){
                animation = CurvedAnimation(parent: animation, curve: Curves.easeIn);              
                return FadeTransition(opacity: animation, child: child);
              },
              pageBuilder: (contex, animation, animationTime){
                return UserDetail(userVM.id);
              }
          ));
      },
      leading: Image.asset('assets/images/user.png',width: MediaQuery.of(context).size.width * 0.1, fit: BoxFit.fitWidth),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      title: 
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        GradientText(userVM.name,
        gradient: userVM.nameColor,
        style: TextStyle(
            fontWeight: FontWeight.w500, fontStyle: FontStyle.normal)),Image.asset(CountryFlags.getFlag(userVM.country),width: 30, fit: BoxFit.fitWidth)]),
      subtitle: Row(
        children:userVM.socialMedia.values.where((element)=> element != null).map((e) => 
          Container(
            padding: EdgeInsets.only(top: 5, left: 5),
            width: 20,
            child:VideoIcon.getIcon(e))).toList()
      ));
  }
}
