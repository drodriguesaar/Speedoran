import 'package:speedoran/src/models/colormodel.dart';

class NameStyleModel {
  NameStyleModel({this.style, this.color, this.colorFrom, this.colorTo});

  String style;
  ColorModel color;
  ColorModel colorFrom;
  ColorModel colorTo;

  factory NameStyleModel.fromMap(Map<String, dynamic> json) => NameStyleModel(
        style: json["style"] == null ? null : json["style"],
        color: json["color"] == null ? null : ColorModel.fromMap(json["color"]),
        colorFrom: json["color-from"] == null
            ? null
            : ColorModel.fromMap(json["color-from"]),
        colorTo: json["color-to"] == null
            ? null
            : ColorModel.fromMap(json["color-to"]),
      );

  Map<String, dynamic> toMap() => {
        "style": style == null ? null : style,
        "color": color == null ? null : color.toMap(),
        "color-from": color == null ? null : colorFrom.toMap(),
        "color-to": color == null ? null : colorTo.toMap(),
      };
}
