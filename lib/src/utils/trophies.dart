import 'package:flutter/cupertino.dart';

class Trophies { 
  static Image formatTrophy(int placing) {
    var asset = "";
    switch (placing) {
      case 1:
        asset = "assets/images/1st.png";
        break;
      case 2:
        asset = "assets/images/2nd.png";
        break;
      case 3:
        asset = "assets/images/3rd.png";
        break;
      default:
        asset = "assets/images/cover.png";
        break;
    }
    return Image.asset(asset, width: 50, fit: BoxFit.fitWidth,alignment: Alignment.center);
  }
}