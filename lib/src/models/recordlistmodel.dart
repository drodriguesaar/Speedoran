import 'package:speedoran/src/models/paginationmodel.dart';
import 'package:speedoran/src/models/leaderboardmodel.dart';

class RecordListModel {
  RecordListModel({
    this.data,
    this.pagination,
  });

  List<LeaderBoardModel> data;
  PaginationModel pagination;

  factory RecordListModel.fromMap(Map<String, dynamic> json) => RecordListModel(
        data: json["data"] == null
            ? null
            : List<LeaderBoardModel>.from(
                json["data"].map((x) => LeaderBoardModel.fromMap(x))),
        pagination: json["pagination"] == null
            ? null
            : PaginationModel.fromMap(json["pagination"]),
      );

  Map<String, dynamic> toMap() => {
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toMap())),
        "pagination": pagination == null ? null : pagination.toMap(),
      };
}
