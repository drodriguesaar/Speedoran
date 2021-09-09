import 'package:flutter/cupertino.dart';

class RunViewModel
{
    int place;
    String time;
    String player;
    String comment;
    String video;
    String platform;
    LinearGradient nameColor;
    String runnerID;

  RunViewModel({
    this.place,
    this.time,
    this.player,
    this.nameColor,
    this.comment,
    this.video,
    this.platform,
    this.runnerID
  }
  );
}