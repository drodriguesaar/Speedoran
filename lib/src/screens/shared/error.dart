import 'package:lottie/lottie.dart';
import 'package:speedoran/style.dart';
import 'package:flutter/cupertino.dart';

class AppError extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Expanded(child: Flex(
      direction: Axis.vertical,
      children: [
        
          Lottie.asset('assets/animations/errorb.json', height: MediaQuery.of(context).size.height*0.5),
          Text("Ops, an error ocurred...", style: SharedWidgetText, textAlign: TextAlign.center)
    ]));
  }
}