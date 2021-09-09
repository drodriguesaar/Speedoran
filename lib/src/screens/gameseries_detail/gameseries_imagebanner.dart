import 'package:flutter/cupertino.dart';
class GameSeriesImageBanner extends StatelessWidget {
  final String _imagePath;
  GameSeriesImageBanner(this._imagePath);
  @override
  Widget build(BuildContext context) {
    return FadeInImage.assetNetwork(
            image:_imagePath,
            fit: BoxFit.fill,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.30,
            placeholder: 'assets/images/cover.png',
            alignment: Alignment.center,
            fadeInCurve: Curves.easeIn,
            fadeInDuration: Duration(milliseconds: 300),
          );
  }
}
