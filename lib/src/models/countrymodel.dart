import 'package:speedoran/src/models/namesmodel.dart';

class CountryModel {
  CountryModel({
    this.code,
    this.names,
  });

  String code;
  NamesModel names;

  factory CountryModel.fromMap(Map<String, dynamic> json) => CountryModel(
        code: json["code"] == null ? null : json["code"],
        names: json["names"] == null ? null : NamesModel.fromMap(json["names"]),
      );

  Map<String, dynamic> toMap() => {
        "code": code == null ? null : code,
        "names": names == null ? null : names.toMap(),
      };
}
