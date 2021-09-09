import 'package:flutter/material.dart';
import 'package:speedoran/style.dart';
import 'src/screens/home/home.dart';

void main() {
  runApp(SpeedoranApp());
}

class SpeedoranApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      title: 'Speedrun.com',
      theme: ThemeData(
          appBarTheme:
              AppBarTheme(textTheme: TextTheme(headline6: AppBarTextStyle)),
          textTheme: TextTheme(
              bodyText1: GridFooterTextStyle,
              bodyText2: Body1TextStyle,
              subtitle1: MenuItemTitleTextStyle,
              subtitle2: MenuItemSubtitleTextStyle,
              headline1: MenuHeaderDrawerTextStyle,
              headline6: TitleTextStyle),
          primarySwatch: Colors.green
          ),
    );
  }
}
