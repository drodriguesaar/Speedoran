import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class FavoriteFAB extends StatelessWidget {

  final  Function callback;
  final ui.Gradient favColor;
  final ui.Gradient defaultColor = ui.Gradient.linear
                          (
                            Offset(4.0, 24.0), 
                            Offset(24.0, 4.0), 
                            [Colors.blueGrey.shade400,Colors.white]
                          );

  FavoriteFAB(this.callback, this.favColor);

  @override
  Widget build(BuildContext context){
      return FloatingActionButton(
                              backgroundColor: Colors.transparent,
                              child: ShaderMask(child: Icon(Icons.favorite, size: 60),
                                                blendMode: BlendMode.srcIn,
                                                shaderCallback: (bounds) {return favColor;}
                                              ),
                              onPressed:()=> callback()); 
  }

}