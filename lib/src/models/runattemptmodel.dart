import 'package:speedoran/src/models/runresultmodel.dart';

class RunAttemptModel {
  RunAttemptModel({
    this.place,
    this.run,
  });

  int place;
  RunResultModel run;

  factory RunAttemptModel.fromMap(Map<String, dynamic> json) => RunAttemptModel(
        place: json["place"] == null ? null : json["place"],
        run: json["run"] == null ? null : RunResultModel.fromMap(json["run"]),
      );

  Map<String, dynamic> toMap() => {
        "place": place == null ? null : place,
        "run": run == null ? null : run.toMap(),
      };
}
