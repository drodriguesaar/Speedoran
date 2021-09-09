import 'package:flutter/material.dart';

class GameThumbnail extends StatelessWidget {
  final String _imagePath;

  GameThumbnail(this._imagePath);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25.0),
          child: FadeInImage.assetNetwork(
            image:_imagePath,
            fit: BoxFit.fill,
            placeholder: 'assets/images/cover.png',
            alignment: Alignment.center,
            fadeInCurve: Curves.easeIn,
            height: MediaQuery.of(context).size.height * 0.1,
            fadeInDuration: Duration(milliseconds: 300),
            
          )));
  }
}
