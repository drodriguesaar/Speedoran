import 'package:lottie/lottie.dart';
import 'package:speedoran/style.dart';
import 'package:flutter/cupertino.dart';

class AppNoResult extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Expanded(child: Flex(
      direction: Axis.vertical,
      children: [
          Lottie.asset('assets/animations/noresult.json'),
          Text("No result", style: SharedWidgetText, textAlign: TextAlign.center)
    ]));
  }
}