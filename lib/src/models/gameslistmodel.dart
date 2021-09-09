import 'package:speedoran/src/models/gamemodel.dart';
import 'package:speedoran/src/models/paginationmodel.dart';

class GamesListModel {
  GamesListModel({
    this.data,
    this.pagination,
  });
  List<GameModel> data;
  PaginationModel pagination;

  factory GamesListModel.fromMap(Map<String, dynamic> json) => 
  GamesListModel(
      data: (json["data"] == null ? null: List<GameModel>.from(json["data"].map((x) => GameModel.fromMap(x)))),
      pagination: (json["pagination"] == null
          ? null
          : PaginationModel.fromMap(json["pagination"])));

  Map<String, dynamic> toMap() => {
        "data": (data == null
            ? null
            : List<GameModel>.from(data.map((x) => x.toMap()))),
        "pagination": (pagination == null ? null : pagination.toMap()),
      };
}
