class SystemModel {
  SystemModel({
    this.platform,
    this.emulated,
    this.region,
    this.platformname,
    this.regionname,
  });

  String platform;
  bool emulated;
  String region;
  String platformname;
  String regionname;

  factory SystemModel.fromMap(Map<String, dynamic> json) => SystemModel(
        platform: json["platform"] == null ? null : json["platform"],
        emulated: json["emulated"] == null ? null : json["emulated"],
        region: json["region"] == null ? null : json["region"],
      );

  Map<String, dynamic> toMap() => {
        "platform": platform == null ? null : platform,
        "emulated": emulated == null ? null : emulated,
        "region": region == null ? null : region,
      };
}
