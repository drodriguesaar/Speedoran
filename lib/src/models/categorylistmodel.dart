import 'package:speedoran/src/models/categorymodel.dart';

class CategoryListModel {
  CategoryListModel({
    this.data,
  });

  List<CategoryModel> data = new List<CategoryModel>();

  factory CategoryListModel.fromMap(Map<String, dynamic> json) =>
      CategoryListModel(
        data: json["data"] == null
            ? null
            : List<CategoryModel>.from(
                json["data"].map((x) => CategoryModel.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toMap())),
      };
}
