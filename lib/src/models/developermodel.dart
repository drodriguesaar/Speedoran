class DeveloperModel {
  String id;
  String name;

  DeveloperModel({this.id, this.name});

  factory DeveloperModel.fromMap(Map<String, dynamic> json) => DeveloperModel(
      id: json["id"] == null ? null : json["id"],
      name: json["name"] == null ? null : json["name"]);

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
      };
}
