import 'package:flutter/cupertino.dart';

class ModeratorViewModel
{
  String id;
  String name;
  String level;
  String country;
  String region;
  LinearGradient nameColor;
  List<String> socialMediaList;
  ModeratorViewModel(this.id, this.name, this.level,this.nameColor,this.country,this.socialMediaList,{this.region});
}