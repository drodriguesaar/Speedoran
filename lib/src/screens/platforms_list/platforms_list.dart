import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:skeleton_text/skeleton_text.dart';
import 'package:speedoran/src/models/platformmodel.dart';
import 'package:speedoran/src/service/platforms_service.dart';
import 'package:speedoran/src/screens/shared/linear_loading.dart';
import 'package:speedoran/src/screens/shared/speedrun_scaffold.dart';
import 'package:speedoran/src/screens/platforms_list/platform_listitem.dart';

class PlaftormsList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new PlaftormsListState();
}

class PlaftormsListState extends State<PlaftormsList> {

  ScrollController _scrollController = ScrollController(keepScrollOffset: true);
  List<PlatformModel> platforms = new List<PlatformModel>();
  bool isLoadingPlatforms = true;
  bool isLoadingMorePlatforms = false;
  int platformsOffset = 20;

  void getPlatforms(){
    PlatformsService.fetchPlatforms(this.platformsOffset)
    .then((value)  {
      var platformsnew = this.platforms;
      platformsnew.addAll(value);
      if(mounted){
        setState((){
          this.platforms = platformsnew;
          this.isLoadingPlatforms = false;
          this.platformsOffset += 20;
          this.isLoadingMorePlatforms = false;
        });
      }
    });
  }

  List<Widget> getPlatformsSkelly(){
    return  List.filled(15, 0).map((e) => Padding(
      padding: EdgeInsets.only(top:10),
      child: 
        Padding(
          padding: EdgeInsets.only(left:20),
          child: SkeletonAnimation(  
            child: Container(  
            height: 60,  
            width: MediaQuery.of(context).size.width * 0.9,  
            decoration: BoxDecoration(  
              borderRadius: BorderRadius.circular(3.0),  
              color: Colors.grey),  
    ))))).toList();
  }

  List<Widget> getPlatformsItems(){
    return  this.platforms.map((e) => Padding(
        padding: EdgeInsets.only(top:10),
        child: PlatformListItem(e))).toList();
  }

  @override
  @protected
  @mustCallSuper
  void initState(){
    super.initState();
    this.getPlatforms();
  }

  @override
  @mustCallSuper
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    var fab = FloatingActionButton(
      onPressed: () {_scrollController.animateTo(0.0, duration: Duration(milliseconds: 1500), curve: Curves.decelerate);},
      child: Icon(Icons.arrow_upward),
      backgroundColor: Colors.green.shade500,
    );

    return WillPopScope(
      child: SpeedrunScaffold(
        body: [
          Expanded(
            child: NotificationListener<ScrollNotification>(
              child: ListView(
                children: this.isLoadingPlatforms ? getPlatformsSkelly() : getPlatformsItems()),
                onNotification: (ScrollNotification scrollInfo) {
                  if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent && !isLoadingMorePlatforms) {
                    if(mounted){
                      setState(() { isLoadingMorePlatforms = true;});
                      getPlatforms();
                    }
                  }
                  return true;
                })),
          LinearLoading(this.isLoadingMorePlatforms)
        ],
        title: "Platforms",
        fab: this.isLoadingPlatforms ? null : fab),
      onWillPop: () async { return false;});
  }
}
