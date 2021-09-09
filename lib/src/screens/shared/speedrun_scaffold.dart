import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:speedoran/src/screens/shared/menu_drawer.dart';
import 'package:speedoran/src/screens/shared/favorite_fab.dart';

class SpeedrunScaffold extends StatelessWidget {
  final String title;
  final List<Widget> body;
  final FloatingActionButton fab;
  final FavoriteFAB favFAB;
  
  SpeedrunScaffold({
          this.title, 
          this.body, 
          this.fab, 
          this.favFAB,
  
  });
  @override
  Widget build(BuildContext context) { 
    return 
      Scaffold(
      backgroundColor: Color.fromARGB(255, 40, 40, 40),
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        bottomOpacity: 0.1,
        centerTitle: true,
        toolbarHeight: 55,
        titleSpacing: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(25)
          )
        ),
        title: Text(this.title)),
      body: Container(
        color: Color.fromARGB(255, 40, 40, 40),
        child: Column(children:this.body)),
      floatingActionButton: this.fab == null ? this.favFAB : this.fab,
      drawer: MenuDrawer(context));
  }
}
