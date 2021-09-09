class ColorModel {
  ColorModel({
    this.light,
    this.dark,
  });

  String light;
  String dark;

  factory ColorModel.fromMap(Map<String, dynamic> json) => ColorModel(
        light: json["light"] == null ? null : json["light"],
        dark: json["dark"] == null ? null : json["dark"],
      );

  Map<String, dynamic> toMap() => {
        "light": light == null ? null : light,
        "dark": dark == null ? null : dark,
      };
}
