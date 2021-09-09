import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:speedoran/src/utils/platformicon.dart';
import 'package:speedoran/src/models/platformmodel.dart';
import 'package:speedoran/src/screens/platforms_list/platformstyles.dart';
import 'package:speedoran/src/screens/platform_detail/platform_detail.dart';

class PlatformListItem extends StatelessWidget
{
  final PlatformModel platform;
  PlatformListItem(this.platform);

  @override
  Widget build(BuildContext context){
    return 
    GestureDetector(
      onTap: () {

        Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 500),
              transitionsBuilder: (context,animation,animationTime,child){
                animation = CurvedAnimation(parent: animation, curve: Curves.easeIn);              
                return FadeTransition(opacity: animation, child: child);
              },
              pageBuilder: (contex, animation, animationTime){
                return PlatformDetail(platform);
              }
          ));

      },
      child: Padding(
      padding: EdgeInsets.only(left:20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Padding(padding: EdgeInsets.only(right:20),
              child: PlatformIcon.generate(
                     platform.name, 
                     width: MediaQuery.of(context).size.width * 0.15,
                     imageFit: BoxFit.fitWidth)
            ),
            Expanded(child: 
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text(platform.name,style: PlatformNameStyle),
                Text('Released: ${platform.released.toString()}', style: PlatformYearStyle)
              ]))
          ])
      ])));
  }
}