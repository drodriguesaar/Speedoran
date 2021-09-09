import 'dart:ui' as ui;
import 'package:lottie/lottie.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:speedoran/src/models/favgamemodel.dart';
import 'package:speedoran/src/screens/shared/error.dart';
import 'package:speedoran/src/service/games_service.dart';
import 'package:speedoran/src/screens/shared/loading.dart';
import 'package:speedoran/src/viewmodels/gameviewmodel.dart';
import 'package:speedoran/src/service/categories_service.dart';
import 'package:speedoran/src/screens/shared/favorite_fab.dart';
import 'package:speedoran/src/persistence/speedrun_localdb.dart';
import 'package:speedoran/src/screens/shared/speedrun_scaffold.dart';
import 'package:speedoran/src/screens/game_detail/game_fullinfo.dart';
import 'package:speedoran/src/screens/game_detail/run_categories.dart';
import 'package:speedoran/src/screens/game_detail/moderators_list.dart';
import 'package:speedoran/src/screens/game_detail/moderators_listtitle.dart';
import 'package:speedoran/src/screens/game_detail/runs_categorylist.dart';

class GameDetail extends StatefulWidget {
  GameDetail(this.game);
  final GameViewModel game;
  @override
  State<StatefulWidget> createState() => new GameDetailState(this.game);
}

class GameDetailState extends State<GameDetail> {
  GameDetailState(this.game);
      
  GameViewModel game;
  bool hasError = false;
  bool isLoading = true;
  bool isLoadingRuns = false;
  bool isAFavoriteGame = false;
  String categorySelectedID = "0";
  ui.Gradient favColor = ui.Gradient.linear
  (
    Offset(4.0, 24.0), 
    Offset(24.0, 4.0), 
    [Colors.blueGrey.shade400,Colors.white]
  );

  void setStatePage(Function e){
    if(mounted){
        this.setState(e);
    }
  }

  void setUpdateFavButtonState(ui.Gradient newFavColor, String text, bool isFav){
    setStatePage(() {
      this.favColor = newFavColor;
      this.isAFavoriteGame = isFav;
    });
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      webPosition: "bottom",
      backgroundColor: Colors.green.shade500,
      textColor: Colors.white,
      fontSize: 16.0);
  }

  void getGame() {
    GamesService.fetchGame(this.game.id)
    .then((gameDetail) async {
      var categoryID = gameDetail?.categories?.first?.id;
      var favGame = await SpeedrunLocalDB.getFavGame(this.game.id);
        setStatePage(() {
          this.game = gameDetail;
          this.isLoading = false;
          this.hasError = false;
          this.categorySelectedID = categoryID; 
          this.isAFavoriteGame = (favGame != null);
          this.favColor = favGame != null ?
                ui.Gradient.linear(Offset(4.0, 24.0), Offset(24.0, 4.0), [Colors.red.shade800,Colors.orange]) : 
                ui.Gradient.linear(Offset(4.0, 24.0), Offset(24.0, 4.0), [Colors.blueGrey.shade400,Colors.white]);
        });
    })
    .catchError((onError){
      this.setStatePage(() {
          this.hasError = true;
          this.isLoading = false;
          this.game = null;
          this.isLoadingRuns=false;
        });
    });
  }

  void markGameAsFavorite() {
    if(this.isAFavoriteGame){
      SpeedrunLocalDB
      .deleteFavGame(this.game.id)
      .then((value) {
        this.setUpdateFavButtonState(
          ui.Gradient.linear(Offset(4.0, 24.0), Offset(24.0, 4.0), [Colors.blueGrey.shade400,Colors.white]), 
          'Game removed from favorites!',
          false);
      });
    } 
    else {
      SpeedrunLocalDB
      .insertFavGame(new FavGameModel(
        favGameID: this.game.id,
        title: this.game.name,
        urlGameCover: this.game.cover
      ))
      .then((value) {
        this.setUpdateFavButtonState(
          ui.Gradient.linear(Offset(4.0, 24.0), Offset(24.0, 4.0), [Colors.red.shade800,Colors.orange]), 
          'Game added to favorites!',
          true);
      });
    }
  }

  void categoryRunChanged(String categoryID) {
    if(categoryID == this.categorySelectedID){
      return;
    }
    setStatePage((){
      this.isLoadingRuns = true;
      this.categorySelectedID = categoryID;
    });
    CategoriesService.fetchCategoryRuns(categoryID)
    .then((value) { 
      setStatePage(() {
        this.game.runs = value;
        this.categorySelectedID = categoryID;
        this.isLoadingRuns = false;
      });
    });
  }

  @override
  @protected
  @mustCallSuper
  void initState() {
    super.initState();
    this.getGame();
  }

  @override
  @mustCallSuper
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    var errorWidget = AppError();
    var loadingWidget = AppLoading();
    var bodyWidgets= new List<Widget>();

    if(isLoading){
      bodyWidgets.add(loadingWidget);
    }
    else if(hasError){
      bodyWidgets.add(errorWidget);
    }
    else {
        var mainWid = Expanded(
            child:  ListView(children: [
            Padding(child: GameFullInfo(this.game), padding: EdgeInsets.only(left:15, right: 15, top: 15)),
            //Fim imagem e descrição do jogo
            //Inicio parte categorias
            Padding(child: RunCategories(this.game, this.categorySelectedID, categoryRunChanged), padding: EdgeInsets.only(left: 15, right:15,top:15)),
            Padding(child: 
                    this.isLoadingRuns ? 
                    Lottie.asset('assets/animations/loading.json',height:125) :
                    RunsCategoryList(this.game), padding: EdgeInsets.only(left: 15, right:15)),
            // //Fim parte categorias
            // //Início parte moderador
            Padding(child:  ModeratorsListTitle(),padding: EdgeInsets.only(left: 15, right:15,top:15)),
            Padding(child: ModeratorsList(this.game),padding: EdgeInsets.only(left: 15, right:15,bottom: 60)),
        ]));
      bodyWidgets.add(mainWid);
    }

    return SpeedrunScaffold(
      title: "Game Details",
      body: bodyWidgets,
      favFAB: 
        this.isLoading || this.hasError ? 
          null : FavoriteFAB(this.markGameAsFavorite, this.favColor));
  }
}
