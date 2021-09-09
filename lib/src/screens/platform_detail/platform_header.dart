import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:speedoran/src/screens/platforms_list/platformstyles.dart';
import 'package:speedoran/src/utils/platformicon.dart';

class PlatformHeader extends StatelessWidget{

  final String name;
  final int releasedYear;

  PlatformHeader(this.name,this.releasedYear);

  @override
  Widget build(BuildContext context){
    return Container(
        height: MediaQuery.of(context).size.height * 0.3,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15)),
                )
              ),
              Expanded(child: 
                PlatformIcon.generate(
                name, 
                width: MediaQuery.of(context).size.width * 0.90, 
                imageFit: BoxFit.fitWidth)  
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15)),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter, 
                    end: Alignment(0.0, 0.1),
                    tileMode: TileMode.clamp,
                    colors: [ Colors.black, Colors.transparent ]
                ))),
              Padding(padding: EdgeInsets.only(bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                  Text(name, style: PlatformNameLargeStyle),
                  Text('Release year ${releasedYear.toString()}', style: PlatformYearLargeStyle)
                ]))
            ]),
        ]));
  }
}