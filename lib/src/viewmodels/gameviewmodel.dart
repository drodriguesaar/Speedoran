import 'package:speedoran/src/viewmodels/categoryviewmodel.dart';
import 'package:speedoran/src/viewmodels/moderatorviewmodel.dart';
import 'package:speedoran/src/viewmodels/runviewmodel.dart';

class GameViewModel {
  String id;
  String name;
  int released;
  String cover;
  String abbrv;
  String weblink;
  List<String> platforms;
  List<String> developers;
  List<ModeratorViewModel> moderators;
  List<CategoryViewModel> categories;
  List<RunViewModel> runs;
  

  GameViewModel({
    this.id,
    this.name,
    this.released,
    this.cover,
    this.abbrv,
    this.platforms,
    this.developers,
    this.moderators,
    this.categories,
    this.runs,
    this.weblink
  });
}
