import 'package:speedoran/src/models/paginationmodel.dart';
import 'package:speedoran/src/models/usermodel.dart';

class UsersListModel {
  UsersListModel({
    this.data,
    this.pagination,
  });
  List<UserModel> data;
  PaginationModel pagination;

  factory UsersListModel.fromMap(Map<String, dynamic> json) => UsersListModel(
      data: (json["data"] == null
          ? null
          : List<UserModel>.from(
              json["data"].map((x) => UserModel.fromMap(x)))),
      pagination: (json["pagination"] == null
          ? null
          : PaginationModel.fromMap(json["pagination"])));

  Map<String, dynamic> toMap() => {
        "data": (data == null
            ? null
            : List<UserModel>.from(data.map((x) => x.toMap()))),
        "pagination": (pagination == null ? null : pagination.toMap()),
      };
}
