import 'package:flutter/cupertino.dart';

class UserViewModel {
  String id;
  String role;
  String name;
  String country;
  String userLink;
  Map<String, String> socialMedia;
  LinearGradient nameColor;

  UserViewModel({
    @required this.id,
    @required this.role,
    @required this.name,
    @required this.country,
    @required this.userLink,
    @required this.nameColor,
    @required this.socialMedia,
  });
}
