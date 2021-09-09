import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

class AppLoading extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Expanded(child: Flex(
      direction: Axis.vertical,
      children: [
        Column(children: [
          Lottie.asset('assets/animations/loading.json',
          height: MediaQuery.of(context).size.height * 0.8)
        ])
    ]));
  }
}