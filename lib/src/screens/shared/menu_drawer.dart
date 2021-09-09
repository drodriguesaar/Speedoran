import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:speedoran/src/screens/about/about.dart';
import 'package:speedoran/src/screens/runs_list/runs_list.dart';
import 'package:speedoran/src/screens/users_list/users_list.dart';
import 'package:speedoran/src/screens/games_list/games_list.dart';
import 'package:speedoran/src/screens/shared/menuitem_drawer.dart';
import 'package:speedoran/src/screens/shared/menuheader_drawer.dart';
import 'package:speedoran/src/screens/platforms_list/platforms_list.dart';
import 'package:speedoran/src/screens/favorites_list/favorites_list.dart';


class MenuDrawer extends StatelessWidget {

  MenuDrawer(this.parentContext);
  final  BuildContext parentContext;

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
            // color: Color.fromARGB(255, 25, 25, 25),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.center,
                    tileMode: TileMode.clamp,
                    stops: [
                  0.1,
                  0.1,
                  1
                ],
                    colors: [
                  Colors.green.shade900,
                  Color.fromARGB(255, 25, 25, 25),
                  Color.fromARGB(255, 25, 25, 25)
                ])),
            child: ListView(
              children: <Widget>[
                MenuHeaderDrawer(),
                MenuItemDrawer(
                    'assets/images/games.png',
                    'Games',
                    'all games available for speedrunning',
                    GamesList(),
                    parentContext),
                MenuItemDrawer(
                    'assets/images/favorite.png',
                    'Favourites',
                    "all games you've marked as favorites",
                    FavoritesList(),
                    parentContext),
                MenuItemDrawer(
                    'assets/images/platforms.png',
                    'Platforms',
                    'all platforms used for speedrunning...',
                    PlaftormsList(),
                    parentContext),
                MenuItemDrawer(
                    'assets/images/runs.png',
                    'Runs',
                    'all finished attempts from our users...',
                    RunsList(),
                    parentContext),
                MenuItemDrawer(
                    'assets/images/users.png',
                    'Users',
                    'all users that moderate and submit runs...',
                    UsersList(),
                    parentContext),
                MenuItemDrawer(
                    'assets/images/about.png',
                    'About',
                    'know more about the speedrunning community',
                    About(),
                    parentContext),
              ],
            )));
  }
}
