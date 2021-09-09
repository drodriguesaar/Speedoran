import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:speedoran/src/models/favgamemodel.dart';
import 'package:speedoran/src/screens/favorites_list/favorites_grid.dart';
import 'package:speedoran/src/screens/shared/loading.dart';
import 'package:speedoran/src/persistence/speedrun_localdb.dart';
import 'package:speedoran/src/screens/shared/speedrun_scaffold.dart';

class FavoritesList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new FavoritesListState();
}

class FavoritesListState extends State<FavoritesList> {
  bool isLoading = true;
  List<FavGameModel> favGames = new List<FavGameModel>();
  SpeedrunLocalDB speedrunLocalDB = new SpeedrunLocalDB();
  void getFavGames(){
    SpeedrunLocalDB
      .getFavGames()
      .then((favs) {
        if(mounted){
          if(favs == null){
            this.setState(() {
              this.isLoading = false;
              this.favGames= new List<FavGameModel>();
            });
          }
          else{
            this.setState(() {
              this.favGames = favs;
              this.isLoading = false;
            });
          }
        }
    });
  }

  @override
  @protected
  @mustCallSuper
  void initState() {
    super.initState();
    getFavGames();
  }

  @override
  @mustCallSuper
  void dispose(){
    super.dispose();
  }

  
  @override
  Widget build(BuildContext context) {

    List<Widget> bodyWidgets = new List<Widget>();

    if(this.isLoading){
      bodyWidgets.add(AppLoading());
    }
    else if(!this.isLoading){
      bodyWidgets.add(Expanded(
          child:AnimatedOpacity(
          opacity: this.isLoading ? 0.0 : 1.0,
          duration: Duration(milliseconds: 600),
          child:  FavoritesGrid(this.favGames)
        ))
      );
    }
    
    return WillPopScope(
      onWillPop: () async {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
        return false;
      },
      child: SpeedrunScaffold(
        title: "Favourites",
        body:  bodyWidgets
      )
    );
  }
}
