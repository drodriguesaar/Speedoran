class NamesModel {
  NamesModel({
    this.international,
    this.japanese,
  });

  String international;
  String japanese;

  factory NamesModel.fromMap(Map<String, dynamic> json) => NamesModel(
        international:
            json["international"] == null ? null : json["international"],
        japanese: json["japanese"] == null ? null : json["japanese"],
      );

  Map<String, dynamic> toMap() => {
        "international": international == null ? null : international,
        "japanese": japanese == null ? null : japanese,
      };
}
