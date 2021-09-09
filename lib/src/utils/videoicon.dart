import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VideoIcon{
  static Widget getIcon(String videoUri){

    if(videoUri==null || videoUri.isEmpty){
      return Icon(Icons.videocam, color: Colors.red);
    }

    var youtuberegex = new RegExp("^(http(s)?:\/\/)?((w){3}.)?youtu(be|.be)?(\.com)?\/.+");
    var twitchregex = new RegExp("^(http(s)?:\/\/)?((w){3}.)?twitch?(\.tv)?\/.+");
    var twitterregex = new RegExp("^(http(s)?:\/\/)?((w){3}.)?twitter?(\.com)?\/.+");
    var hitboxregex =  new RegExp("^(http(s)?:\/\/)?((w){3}.)?hitbox?(\.com)?\/.+");
    var speedrunliveregex = new RegExp("^(http(s)?:\/\/)?((w){3}.)?speedrunslive?(\.com)?\/.+");
    
    if(youtuberegex.hasMatch(videoUri)){
      return Image.asset('assets/images/socialmedia/youtube.png');
    }
    else if(twitterregex.hasMatch(videoUri)){
      return Image.asset('assets/images/socialmedia/twitter.png');
    }
    else if(twitchregex.hasMatch(videoUri)){
      return Image.asset('assets/images/socialmedia/twitch.png');
    }
    else if(hitboxregex.hasMatch(videoUri)){
      return Image.asset('assets/images/socialmedia/twitch.png');
    }
    else if(speedrunliveregex.hasMatch(videoUri)){
      return Image.asset('assets/images/socialmedia/speedrunslive.png');
    }
    else{
      return Icon(Icons.videocam, color: Colors.white);
    }
    
  }
}