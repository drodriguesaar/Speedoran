import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:speedoran/src/screens/shared/error.dart';
import 'package:speedoran/src/service/user_service.dart';
import 'package:speedoran/src/models/personalbestmodel.dart';
import 'package:speedoran/src/viewmodels/userviewmodel.dart';
import 'package:speedoran/src/screens/shared/speedrun_scaffold.dart';
import 'package:speedoran/src/screens/user_detail/user_detailfull.dart';
import 'package:speedoran/src/screens/user_detail/user_personalbests.dart';

class UserDetail extends StatefulWidget{
  final String userID;
  UserDetail(this.userID);
  @override
  State<StatefulWidget> createState() => new UserDetailState(this.userID);
}

class UserDetailState extends State<UserDetail>{
  
  UserDetailState(this.userID);
  
  bool isLoading = true;
  bool hasError = false;
  bool hasResult = false;

  String userID;
  UserViewModel userViewModel;
  List<PersonalBestModel> personalBests;
  UserService userService = new UserService();

  void setStatePage(Function e){
    if(mounted){
        this.setState(e);
    }
  }

  void getUser() {
    UserService.fetchUser(userID)
    .then((value) {
      this.setStatePage((){
        this.isLoading = false;
        this.hasError = false;
        this.hasResult = (value != null);
        this.userViewModel = value;
      });
    }).catchError((e){
      this.setStatePage((){
        this.isLoading = false;
        this.hasError = true;
        this.hasResult = false;
        this.userViewModel = null;
      });
    });

    UserService
      .fetchUserPersonalBests(userID)
      .then((userPersonalBests) {
        this.setStatePage((){
          this.personalBests = userPersonalBests;
        });
      });
  }

  @override
  @protected
  @mustCallSuper
  void initState() {
    super.initState();
    this.getUser();
  }

  @override
  @mustCallSuper
  void dispose(){
      super.dispose();
  }

  @override
  Widget build(BuildContext context){   
  
    var errorwidget = AppError();
    var contentList = new List<Widget>();
    if(this.hasError){
      contentList.add(errorwidget);
    }
    else {
      contentList.add(
        Expanded(flex: 1, child: 
          ListView(
            children: [
              UserDetailFull(this.userViewModel),
              UserPersonalBests(this.personalBests)
            ]
        )));
    }
    return SpeedrunScaffold(
      title: "User Details",
      body: contentList);
  }
}