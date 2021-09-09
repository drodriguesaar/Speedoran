class StatusModel {
  StatusModel({
    this.status,
    this.examiner,
    this.verifyDate,
  });

  String status;
  String examiner;
  DateTime verifyDate;

  factory StatusModel.fromMap(Map<String, dynamic> json) => StatusModel(
        status: json["status"] == null ? null : json["status"],
        examiner: json["examiner"] == null ? null : json["examiner"],
        verifyDate: json["verify-date"] == null
            ? null
            : DateTime.parse(json["verify-date"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status == null ? null : status,
        "examiner": examiner == null ? null : examiner,
        "verify-date": verifyDate == null ? null : verifyDate.toIso8601String(),
      };
}
