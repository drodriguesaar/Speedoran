import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PlatformIcon{
  static Image generate(String platformName, {double width = 0.0, double height = 0.0, BoxFit imageFit = BoxFit.none})
  {
    String platformAsset="cover.png";

    switch(platformName.toLowerCase()){
      case "atari st":
        platformAsset = "atari_st.png";
      break;
      case "colecovision":
        platformAsset = "collecovision.png";
      break;
      case "commodore 64":
        platformAsset = "commodore64.png";
      break;
      case "commodore cdtv":
        platformAsset = "commodorecdtv.png";
      break;
      case "commodore vic-20":
        platformAsset = "commodorevic20.png";
      break;
      case "dragon 32/64":
        platformAsset = "dragon3264.png";
      break;
      case "bbc micro":
        platformAsset="bbcmicro.png";
      break;
      case "playstation":
        platformAsset = "ps1.png";
      break;
      case "playstation 2":
        platformAsset = "ps2.png";
      break;
      case "playstation 3":
        platformAsset = "ps3.png";
      break;
      case "playstation 4":
        platformAsset = "ps4.png";
      break;
      case "playstation 4 pro":
        platformAsset = "ps4pro.png";
      break;
      case "playstation 5":
        platformAsset = "ps5.png";
      break;
      case "playstation now":
        platformAsset = "psnow.png";
      break;
      case "playstation portable":
        platformAsset = "psp.png";
      break;
      case "playstation vita":
        platformAsset = "psvita.png";
      break;
      case "playstation classic":
        platformAsset = "psmini.png";
      break;
      case "dreamcast":
        platformAsset = "dreamcast.png";
      break;
      case "fairchild channel f":
        platformAsset = "fairchild.png";
      break;
      case "famicom disk system":
        platformAsset = "famicondisksystem.png";
      break;
      case "fm towns":
        platformAsset = "fmtowns.png";
      break;
      case "game & watch":
        platformAsset = "gamewatch.png";
      break;
      case "game boy":
        platformAsset = "gameboy.png";
      break;
      case "game boy advance":
        platformAsset = "gameboyadv.png";
      break;
      case "game boy color":
        platformAsset = "gameboycolor.png";
      break;
      case "game.com":
        platformAsset = "gamecom.png";
      break;
      case "gamecube":
        platformAsset = "gamecube.png";
      break;
      case "google stadia":
        platformAsset = "stadia.png";
      break;
      case "graphing calculator":
        platformAsset = "graphingcalc.png";
      break;
      case "htc vive":
        platformAsset = "htcvive.png";
      break;
      case "intellivision":
        platformAsset = "intellivision.png";
      break;
      case "ique player":
        platformAsset = "ique.png";
      break;
      case "java phone":
        platformAsset = "java.png";
      break;
      case "ios":
        platformAsset = "ios.png";
      break;
      case "linux":
        platformAsset = "linux.png";
      break;
      case "macintosh":
        platformAsset = "macintosh.png";
      break;
      case "meganet":
        platformAsset = "meganet.png";
      break;
      case "ms-dos":
        platformAsset = "msdos.png";
      break;
      case "msx":
      case "msx2":
        platformAsset = "msx.png";
      break;
      case "n-gage":
        platformAsset = "ngage.png";
      break;
      case "nec pc-88 series":
        platformAsset = "ncpc88.png";
      break;
      case "nec pc-98 series":
        platformAsset = "ncpc98.png";
      break;
      case "neo geo aes":
        platformAsset = "neogeoaes.png";
      break;
      case "neo geo cd":
        platformAsset = "neogeocd.png";
      break;
      case "neo geo mini":
        platformAsset = "neogeomini.png";
      break;
      case "neo geo pocket color":
        platformAsset = "neogeopocket.png";
      break;
      case "neo geo x":
        platformAsset = "neogeox.png";
      break;
      case "neo geo x":
        platformAsset = "neogeox.png";
      break;
      case "nes classic mini":
        platformAsset = "nesclassicmini.png";
      break;
      case "new nintendo 3ds virtual console":
      case "new nintendo 3ds":
        platformAsset = "nintendo3ds.png";
      break;
      case "nintendo 64":
        platformAsset = "n64.png";
      break;
    }

    switch(imageFit){
      case BoxFit.fitWidth:
        return Image.asset(
            'assets/images/platforms/$platformAsset', 
            width: width, 
            fit: imageFit);
      break;
      case BoxFit.fitHeight:
        return Image.asset(
          'assets/images/platforms/$platformAsset', 
          height: height, 
          fit: imageFit);
      break;
      default:
        return Image.asset(
          'assets/images/platforms/$platformAsset');
      break;
    }
  }
}