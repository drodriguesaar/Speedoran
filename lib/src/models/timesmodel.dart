class TimesModel {
  TimesModel({
    this.primary,
    this.primaryT,
    this.realtime,
    this.realtimeT,
    this.realtimeNoloads,
    this.realtimeNoloadsT,
    this.ingame,
    // this.ingameT,
  });

  String primary;
  double primaryT;
  String realtime;
  double realtimeT;
  dynamic realtimeNoloads;
  int realtimeNoloadsT;
  dynamic ingame;
  // double ingameT;

  factory TimesModel.fromMap(Map<String, dynamic> json) => TimesModel(
        primary: json["primary"] == null ? null : json["primary"],
        primaryT: json["primary_t"] == null ? null : json["primary_t"].toDouble(),
        realtime: json["realtime"] == null ? null : json["realtime"],
        realtimeT: json["realtime_t"] == null ? null : json["realtime_t"].toDouble()
      );

  Map<String, dynamic> toMap() => {
        "primary": primary == null ? null : primary,
        "primary_t": primaryT == null ? null : primaryT,
        "realtime": realtime == null ? null : realtime,
        "realtime_t": realtimeT == null ? null : realtimeT
      };
}
