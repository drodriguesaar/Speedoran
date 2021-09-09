import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:skeleton_text/skeleton_text.dart';
import 'package:speedoran/src/service/games_service.dart';
import 'package:speedoran/src/viewmodels/gameviewmodel.dart';
import 'package:speedoran/src/screens/shared/linear_loading.dart';
import 'package:speedoran/src/screens/games_list/game_listitem.dart';
import 'package:speedoran/src/screens/shared/speedrun_scaffold.dart';
import 'package:speedoran/src/screens/shared/error.dart';

class GamesList extends StatefulWidget {
  final List<GameViewModel> _games = new List<GameViewModel>();
  @override
  State<StatefulWidget> createState() => new GamesListState(this._games);
}

class GamesListState extends State<GamesList> {
  ScrollController _scrollController = ScrollController(keepScrollOffset: true);  
  List<GameViewModel> _games;
  
  bool hasError = false;
  bool isLoading = true;
  int gamesOffset = 0;
  String searchTerm = "";
  bool isLoadingMore = false;
  bool hasMoreResults = false;
  String errorMessage = "";
  String hintLabelText = "a specific game...";
  bool isSearchingByTerm = false;
  List<bool> selectedButtons = [true, false];

  FocusNode searchInputFocus;
  TextEditingController searchTermTextController;

  GamesListState(this._games);

  @override
  @protected
  @mustCallSuper
  void initState() {
    if (mounted) {
      super.initState();
      searchTermTextController = new TextEditingController(text: this.searchTerm);
      searchInputFocus = FocusNode();
      getGames();
    }
  }

  @override
  @mustCallSuper
  void dispose(){
    searchInputFocus.dispose();
    searchTermTextController.dispose();
    _games.clear();
    super.dispose();
  }
  
  void onToggleButtonPressed(int index){
    unfocusTextField();
    scrollUp();
    var _isGamesSelected = index == 0;
    var toggleButtonSelection = _isGamesSelected ? [true, false] : [false, true];
    if(mounted){
      this.setState(() {
        this.hintLabelText = _isGamesSelected ? "a specific game..." : "a specific series...";
        this.selectedButtons = toggleButtonSelection;
        this._games = new List<GameViewModel>();
        this.isLoading = true;
        this.isLoadingMore = false;
        this.hasMoreResults = true;
        this.searchTerm = "";
        this.isSearchingByTerm = false;
        this.gamesOffset = 0;
      });   
    }

    if(_isGamesSelected){
      getGames();
    }
    else{
      getGamesSeries();
    }
  }

  bool onScrollNotificationInfo(ScrollNotification scrollInfo) {

    var hasArrivedBottom = scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent;
    var isReadyToLoadMore = !this.isLoadingMore && this.hasMoreResults;
    var canLoadMore = (hasArrivedBottom && isReadyToLoadMore);

    if (canLoadMore) {
      if(mounted){
        setState(() { this.isLoadingMore = hasMoreResults; });
      }
      
      var isGamesOptionSearchSelected = selectedButtons[0];
      var isSeriesOptionSearchSelected = selectedButtons[1];
      
      if (isGamesOptionSearchSelected) {
        if(this.isSearchingByTerm){
          getGamesByTerm(this.searchTerm, isPagination: true);
        }
        else{
          getGames();
        }
      }
      else if(isSeriesOptionSearchSelected){
        if(this.isSearchingByTerm){
          getGamesSeriesByTerm(this.searchTerm, isPagination: true);
        }
        else{
          getGamesSeries();
        }
      }
    }
    return true;
  }

  void unfocusTextField({bool cleanTextField = false}){
    
    if(cleanTextField){
      searchTermTextController.clear();
      if(mounted){
        this.setState(() {
          this.isSearchingByTerm = false;
          this.searchTerm = "";
        });
      }
    }

    searchInputFocus.unfocus();
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.focusedChild?.unfocus();
    }

  }  
  
  void getGames() {
    GamesService
    .fetchGames(this.gamesOffset)
    .then((gamesResult) {
      if (mounted && this.selectedButtons[0]) {
        setState(() {
          this.hasMoreResults = (gamesResult.length == 50);
          this._games.addAll(gamesResult);
          this.isLoadingMore = false;
          this.gamesOffset += 50;
          this.isLoading = false;
        });
      }
    }).catchError((value) {
      setErrorStatus();
    });
  }

  void getGamesByTerm(String searchTerm, {bool isPagination = false}){
    
    //1st Dismiss keyboard and scroll up
    unfocusTextField();   

    /*
      2nd: Validate what type of search will be done. If it's a search with NO pagination, then we set the default values of the state. 
      This means we're gonna make a new search with a new term.
    */
    if(!isPagination){  
      scrollUp();
      if(mounted){
        this.setState(() {
          this._games = new List<GameViewModel>();
          this.gamesOffset = 0;
          this.hasMoreResults = true;
          this.isLoading = true;
          this.isLoadingMore = false;
          this.isSearchingByTerm=true;
          this.searchTerm = searchTerm;
        });
      }
    }
    //If it's a search with pagination, it means  we're gonna keep the actual state and keep search games based on the given term.
    else {
      if(mounted){
        this.setState(() {
          this.hasMoreResults = true;
          this.isLoading = false;
          this.isLoadingMore = true;
          this.isSearchingByTerm = true;
          this.searchTerm = searchTerm;
        });
      }
    }
    

    GamesService
      .fetchGamesByTerm(this.searchTerm, this.gamesOffset)
      .then((gamesResult) {
        if(mounted && this.selectedButtons[0]){
          setState(() {
            this.hasMoreResults = (gamesResult.length == 50);
            this._games.addAll(gamesResult);
            this.isLoadingMore = false;
            this.gamesOffset += 50;
            this.isLoading = false;
          });
        }
      })
      .catchError((value){
        setErrorStatus();
      });
  }
  
  void getGamesSeries(){
   GamesService
    .fetchGameSeries(this.gamesOffset)
    .then((gameSeriesresult) {
      if (mounted && this.selectedButtons[1]) {
        setState(() {
          this.hasMoreResults = (gameSeriesresult.length == 50);
          this._games.addAll(gameSeriesresult);
          this.isLoadingMore = false;
          this.gamesOffset += 50;
          this.isLoading = false;
        });
      }
    }).catchError((onErvalueror){
      this.setErrorStatus();
    });
  }

  void getGamesSeriesByTerm(String term, {bool isPagination = false}){
    //1st Dismiss keyboard and scroll up
    unfocusTextField();   

    /*
      2nd: Validate what type of search will be done. If it's a search with NO pagination, then we set the default values of the state. 
      This means we're gonna make a new search with a new term.
    */
    if(!isPagination){  
      scrollUp();
      if(mounted){
        this.setState(() {
          this._games = new List<GameViewModel>();
          this.gamesOffset = 0;
          this.hasMoreResults = true;
          this.isLoading = true;
          this.isLoadingMore = false;
          this.isSearchingByTerm=true;
          this.searchTerm = term;
        });
      }
    }
    //If it's a search with pagination, it means  we're gonna keep the actual state and keep search games based on the given term.
    else {
      if(mounted){
        this.setState(() {
          this.hasMoreResults = true;
          this.isLoading = false;
          this.isLoadingMore = true;
          this.isSearchingByTerm = true;
          this.searchTerm = term;
        });
      }
    }
    

    GamesService
      .fetchGameSeriesByTerm(this.searchTerm, this.gamesOffset)
      .then((gamesResult) {
        if(mounted && this.selectedButtons[1]){
          setState(() {
            this.hasMoreResults = (gamesResult.length == 50);
            this._games.addAll(gamesResult);
            this.isLoadingMore = false;
            this.gamesOffset += 50;
            this.isLoading = false;
          });
        }
      })
      .catchError((value){
        setErrorStatus();
      });
  }

  void setErrorStatus(){
    if(mounted){
      setState(() {
        this.hasError = true;
        this.isLoadingMore = false;
        this.isLoading = false;
      });
    }
  }

  void endSearch(){
    scrollUp();
    unfocusTextField(cleanTextField: true);
    if(mounted){
      this.setState(() {
        this._games = new List<GameViewModel>();
        this.isLoading = true;
        this.isLoadingMore = false;
        this.gamesOffset = 0;
      });
    }
    if(this.selectedButtons[0])
    {this.getGames();}
    else
    {this.getGamesSeries(); }
  }

  void scrollUp(){
    if(_scrollController.position.pixels==0.0){
      return;
    }
    _scrollController.animateTo(0.0, duration: Duration(milliseconds: 1500), curve: Curves.decelerate);
  }

  Widget getGamesGrid(){
    return getGrid(_games.map((e) => new GameListItem(e, isSerie: this.selectedButtons[1])).toList());
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
    return Expanded(child: 
      GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 20.0,
        crossAxisSpacing: 10.0,
        controller: _scrollController,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 20.0),
        children: widgets,
    ));
  }

  Widget getSearchTextField(){
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 15),
      child: TextField(
        controller: new TextEditingController(text:this.searchTerm),
        autofocus: false,
        focusNode: searchInputFocus,
        maxLines: 1,
        enabled: !this.isLoading,
        keyboardType: TextInputType.text,
        onSubmitted: (value) {this.selectedButtons[0] ? this.getGamesByTerm(value) : this.getGamesSeriesByTerm(value);},
        textAlignVertical: TextAlignVertical.top,
        textInputAction: TextInputAction.search,
        keyboardAppearance: Brightness.dark,
        maxLength: 50,
        maxLengthEnforced: true,
        
        decoration: InputDecoration(
          counterText: "",
          isDense: true,
          contentPadding: EdgeInsets.all(1.0),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          icon: Padding(child:Icon(Icons.search, color: Colors.green.shade400, size: 30), padding: EdgeInsets.only(top: 32)),
          suffix: IconButton(
            alignment: Alignment.center,
            iconSize: 30,
            visualDensity: VisualDensity.comfortable,
            icon: Icon(Icons.close), 
            color: Colors.green.shade400, 
            onPressed: endSearch),
          border: InputBorder.none,
          hintText: this.hintLabelText,
          hintStyle: TextStyle(color: Colors.grey.shade600, fontSize: 18.0, height: -1),
          labelText: "filter by",
          labelStyle: new TextStyle(color: Colors.green.shade400, fontSize: 20, height:3),
          alignLabelWithHint: true,
        ))
    );
  }

  Widget getGamesSeriesToggleButtons(){
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(left:10.0,right:10.0,top:10.0,bottom: 1),
      width: MediaQuery.of(context).size.width * 0.7,
      child: ToggleButtons(
        onPressed: onToggleButtonPressed,
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.055,
          minHeight: MediaQuery.of(context).size.height * 0.055,
          maxWidth: MediaQuery.of(context).size.width * 0.46,
          minWidth: MediaQuery.of(context).size.width * 0.46,
        ),
        splashColor: Colors.green.shade100,
        isSelected: selectedButtons,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderColor: Colors.green.shade500,
        color: Colors.green,
        fillColor: Colors.green.shade800,
        children: [
          Padding(padding: EdgeInsets.all(5),child:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [Text('Games', style:TextStyle(color: Colors.white, fontSize: 18.0))]) 
          ),
          Padding(padding: EdgeInsets.all(5),child: 
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [Text('Series', style:TextStyle(color: Colors.white, fontSize: 18.0))])
          )
    ]));
  }

  Widget getScrollUpFAB(){
    return FloatingActionButton(
      onPressed:scrollUp,
      child: Icon(Icons.arrow_upward),
      backgroundColor: Colors.green.shade500,
    );
  }

  @override
  Widget build(BuildContext context) {
    
    var bodyContent = this.hasError ? AppError() : Expanded(
      child:NotificationListener<ScrollNotification> (
        onNotification: onScrollNotificationInfo,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            getGamesSeriesToggleButtons(),
            getSearchTextField(), 
            this.isLoading ? getGamesGridSkelly() : getGamesGrid()
          ]
    )));

    return WillPopScope(
      onWillPop:() async { 
        unfocusTextField(cleanTextField: true);
        return false;
      },
      child: SpeedrunScaffold(
        title:"Games",
        body:  <Widget>[bodyContent, LinearLoading(this.isLoadingMore)],
        fab: this.isLoading || this.hasError ? null : getScrollUpFAB())
    );
  }
}