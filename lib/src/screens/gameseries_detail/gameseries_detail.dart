import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:skeleton_text/skeleton_text.dart';
import 'package:speedoran/src/screens/gameseries_detail/gameseries_imagebanner.dart';
import 'package:speedoran/src/viewmodels/gameviewmodel.dart';
import 'package:speedoran/src/service/games_service.dart';
import 'package:speedoran/src/screens/games_list/game_listitem.dart';

class GameSeriesDetail extends StatefulWidget {
  GameSeriesDetail(this.gameSeries);
  final GameViewModel gameSeries;
  @override
  State<StatefulWidget> createState()=> new GameSeriesDetailState(this.gameSeries);
}

class GameSeriesDetailState extends State<GameSeriesDetail>{
  GameSeriesDetailState(this.serie);
  int offset = 0;
  bool isLoadingHeader = true;
  bool isLoadingGamesGrid = true;
  bool isLoadingMore = false;
  bool hasMoreResults = false;
  GameViewModel serie;
  List<GameViewModel> serieGames;
  
  @protected
  @mustCallSuper
  @override
  void initState() {
    super.initState();
    getSerie();
    getSerieGames();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void getSerie(){
    GamesService
      .fetchGameSerie(this.serie.id)
      .then((value) {
        if(mounted){
          this.setState(() {
            this.isLoadingHeader = false;
            this.serie = value;
          });
        }
      });
  }

  void getSerieGames(){
    GamesService
      .fetchGameSerieGames(this.serie.id, this.offset)
      .then((value) {
        if(mounted){
          this.setState(() {
            this.isLoadingGamesGrid = false;
            this.serieGames = value;
            this.hasMoreResults = value.length == 50;
            this.offset += 50;
          });
        }
      });
  }

  bool onScrollNotificationInfo(ScrollNotification scrollInfo) {
    var hasArrivedBottom = scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent;
    var isReadyToLoadMore = !this.isLoadingMore && this.hasMoreResults;
    var canLoadMore = (hasArrivedBottom && isReadyToLoadMore);
    if (canLoadMore) {
      if(mounted){
        setState(() { this.isLoadingMore = hasMoreResults; });
      }
      this.getSerieGames();      
    }
    return true;
  }

  Widget getGamesGrid(){
    return getGrid(serieGames.map((e) => new GameListItem(e, isSerie: false)).toList());
  }

  Widget getGamesGridSkelly(){
    return getGrid(List.filled(50, 0).map((e) => SkeletonAnimation(
      curve: Curves.easeInExpo,
      child: Container(  
        padding: EdgeInsets.only(bottom: 1),
        height: 200,  
        width: 200,  
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0), color: Colors.grey.shade900)
      )
    )).toList());
  }

  Widget getGrid(List<Widget> widgets){
    return SliverGrid.count(
        crossAxisCount: 3,
        mainAxisSpacing: 20.0,
        crossAxisSpacing: 10.0,
        children: widgets
    );
  }

  Widget getHeader(){
    return SliverAppBar(
      stretch: true,
      backgroundColor: Color.fromARGB(255, 40, 40, 40),
      expandedHeight: MediaQuery.of(context).size.height * 0.3,
      flexibleSpace: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          FlexibleSpaceBar(
            collapseMode: CollapseMode.parallax,
            background: Padding(padding: EdgeInsets.all(2), child:GameSeriesImageBanner(this.isLoadingHeader ? "" : this.serie.cover)),
            stretchModes: [StretchMode.zoomBackground, StretchMode.fadeTitle],
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
              begin: Alignment.bottomCenter, 
              end: Alignment(0.0, 0.001),
              tileMode: TileMode.clamp,
              colors: [ Colors.black, Colors.transparent ]
          ))),
          Padding(
            padding: EdgeInsets.all(20), 
            child: Text(this.serie.name, 
                    textAlign: TextAlign.center,
                    style: TextStyle(
                    color: Colors.white, 
                    fontSize: 40, 
                    fontWeight: FontWeight.bold)
          ))
      ])
    );
  }

  Widget getSliver(){
    return Container(
      color: Color.fromARGB(255, 40, 40, 40),
      child: NotificationListener<ScrollNotification> (
        onNotification: onScrollNotificationInfo,
        child: CustomScrollView ( 
          slivers: <Widget>[
            getHeader(),
            SliverPadding(
              padding: EdgeInsets.all(10), 
              sliver: this.isLoadingGamesGrid ? this.getGamesGridSkelly() : this.getGamesGrid())
          ])
        ));
  }

  @override
  Widget build(BuildContext context)
  {
    return getSliver();
  }
}