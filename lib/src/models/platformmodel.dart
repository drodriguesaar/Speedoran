class PlatformModel {
  PlatformModel({this.id, this.name, this.released});

  String id;
  String name;
  int released;

  factory PlatformModel.fromMap(Map<String, dynamic> json) => PlatformModel(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        released: json["released"] == null ? null : json["released"],
      );
  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "released": released == null ? null : released
      };
}
