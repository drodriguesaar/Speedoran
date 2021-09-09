import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MenuHeaderDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      curve: Curves.bounceIn,
      duration: Duration(milliseconds: 100),
      child: Image.asset('assets/images/app_logo_full.png', fit: BoxFit.contain)
    );
  }
}
