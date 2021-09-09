import 'package:speedoran/src/models/imagemodel.dart';

class AssetModel {
  AssetModel({
    this.logo,
    this.coverTiny,
    this.coverSmall,
    this.coverMedium,
    this.coverLarge,
    this.icon,
  });

  ImageModel logo;
  ImageModel coverTiny;
  ImageModel coverSmall;
  ImageModel coverMedium;
  ImageModel coverLarge;
  ImageModel icon;

  factory AssetModel.fromMap(Map<String, dynamic> json) => AssetModel(
      logo: json["logo"] == null ? null : ImageModel.fromMap(json["logo"]),
      coverTiny: json["cover-tiny"] == null
          ? null
          : ImageModel.fromMap(json["cover-tiny"]),
      coverSmall: json["cover-small"] == null
          ? null
          : ImageModel.fromMap(json["cover-small"]),
      coverMedium: json["cover-medium"] == null
          ? null
          : ImageModel.fromMap(json["cover-medium"]),
      coverLarge: json["cover-large"] == null
          ? null
          : ImageModel.fromMap(json["cover-large"]),
      icon: json["icon"] == null ? null : ImageModel.fromMap(json["icon"]));

  Map<String, dynamic> toMap() => {
        "logo": logo == null ? null : logo.toMap(),
        "cover-tiny": coverTiny == null ? null : coverTiny.toMap(),
        "cover-small": coverSmall == null ? null : coverSmall.toMap(),
        "cover-medium": coverMedium == null ? null : coverMedium.toMap(),
        "cover-large": coverLarge == null ? null : coverLarge.toMap(),
        "icon": icon == null ? null : icon.toMap()
      };
}
