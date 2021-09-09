import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:speedoran/src/service/user_service.dart';
import 'package:speedoran/src/screens/shared/noresult.dart';
import 'package:speedoran/src/viewmodels/userviewmodel.dart';
import 'package:speedoran/src/screens/shared/linear_loading.dart';
import 'package:speedoran/src/screens/users_list/user_listitem.dart';
import 'package:speedoran/src/screens/shared/speedrun_scaffold.dart';
import 'package:speedoran/src/screens/users_list/user_listskelly.dart';

class UsersList extends StatefulWidget {
  final List<UserViewModel> _user = List<UserViewModel>();
  @override
  State<StatefulWidget> createState() => new UsersListState(_user);
}

class UsersListState extends State<UsersList> {
  
  ScrollController _scrollController = ScrollController(keepScrollOffset: true);
  List<UserViewModel> _users;
  FocusNode userFocusNode;
  
  int usersOffset = 50;
  bool isLoading = true;
  bool hasResult = false;
  bool hasError = false;
  bool isLoadingMore = false;
  bool isSearchingByTerm = false;
  String errorMessage = "";

  UsersListState(this._users);

   void unfocusTextField(){
    userFocusNode.unfocus();
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.focusedChild?.unfocus();
    }
  }

  Widget getBodyContent(){
    var usersListView = getUsersListView();
    return Expanded(
      child: NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scrollInfo) 
      {
        if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent && !isLoadingMore) {
          if(mounted){
            setState(() {
              isLoadingMore = true;
            });
            getUsers();
          }
        }
        return true;
      },
      child: usersListView
    ));
  }

  Widget getUsersListView(){
    return ListView.builder(
      controller: _scrollController,
      physics: BouncingScrollPhysics(),
      itemCount: this._users.length,
      itemBuilder: (context, index) {
        return UserListItem(this._users[index]);
      });
  }

  Widget getTextInputWidget(){
    return Padding(
      padding:EdgeInsets.only(left:15,top:5),
      child:
      TextField(
        onTap: () {
          if(mounted && !this.isSearchingByTerm){
            setState(() {
              this.isSearchingByTerm = true;
            }); 
          }
        },
        keyboardType: TextInputType.text,
        focusNode: userFocusNode,
        maxLines: 1,
        enabled: !this.isLoading,
        onSubmitted: (value) { this.getUsersByTerm(value); },
        decoration: InputDecoration(
          isDense: true,
          labelStyle: new TextStyle(color: Colors.green.shade400, fontSize: 19),
          icon: Padding(child:Icon(Icons.search, color: Colors.green.shade400, size: 30), padding: EdgeInsets.only(top: 20)),
          border: InputBorder.none,
          hintText: 'enter runners name...',
          alignLabelWithHint: true,
          labelText: 'Tap here to search a runner',
          hintStyle: TextStyle(color: Colors.grey.shade600, fontSize: 18.0)
        )
      )
    );
  }

  void getUsers() {
    UserService.fechUsers(usersOffset).then((usersResult) {
      setState(() {
        this._users.addAll(usersResult);
        this.isLoadingMore = false;
        this.usersOffset += 50;
        this.isLoading = false;
        this.hasResult = usersResult.isNotEmpty;
        this.hasError = false;
      });  
    });
  }

  void getUsersByTerm(String term) {
    if(term.isEmpty){
     unfocusTextField();
    }

    if(term.isEmpty||term.length < 4){
      return;
    }
    if(mounted){
      this.setState(() {
        this.usersOffset = 50;
        this.isLoading = true;
        this.hasError = false;
        this.hasResult = false;
        this.isLoadingMore = false;
        
      });
    }
    UserService.fetchUsersByTerm(term, this.usersOffset)
    .then((value) {
      if(mounted){
        this.setState(() {
          this._users = value;
          this.usersOffset += 50;
          this.isLoading = false;
          this.hasError = false;
          this.hasResult = value.isNotEmpty;
          this.isLoadingMore = false;
        });
      }
    });
  }

  @override
  @protected
  @mustCallSuper
  void initState() {
    super.initState();
    this.getUsers();
    userFocusNode = FocusNode();
  }

  @override
  void dispose() {
    userFocusNode.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {   
    List<Widget> bodyContent = new List<Widget>();
    
    if (this.hasResult) {
      bodyContent.add(getTextInputWidget());
      bodyContent.add(getBodyContent());
      bodyContent.add(LinearLoading(this.isLoadingMore));
    } else if (this.isLoading) {
      bodyContent.add(UserListSkelly());
    } else if (!this.hasResult) {
     bodyContent.add(getTextInputWidget());
     bodyContent.add(AppNoResult());
    }

    var floatingActionButton = FloatingActionButton(
      onPressed: () {_scrollController.animateTo(0.0,duration: Duration(milliseconds: 1500), curve: Curves.decelerate);},
      child: Icon(Icons.arrow_upward),
      backgroundColor: Colors.green.shade500,
    );
    
    var existSearchTermFAB = FloatingActionButton(
      onPressed: (){
        unfocusTextField();
        if(mounted && this.isSearchingByTerm){
          setState(() {
            this.isSearchingByTerm = false;
          });
        }
        return false;
      },
      child: Icon(Icons.close),
      backgroundColor: Colors.green.shade500
    );

    return WillPopScope(child: 
      SpeedrunScaffold(
        title: 'Users',
        body:bodyContent,
        fab: this.isLoading ? null : 
          (this.isSearchingByTerm ? existSearchTermFAB : floatingActionButton)
        ), 
        onWillPop:() async { 
          unfocusTextField();
          if(mounted && this.isSearchingByTerm){
            setState(() {
              this.isSearchingByTerm = false;
            });
          }
          return false;
         });
  }
}
