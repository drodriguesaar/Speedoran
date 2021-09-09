import 'countrymodel.dart';

class LocationModel {
  LocationModel({
    this.country,
    this.region,
  });

  CountryModel country;
  CountryModel region;

  factory LocationModel.fromMap(Map<String, dynamic> json) => LocationModel(
        country: json["country"] == null
            ? null
            : CountryModel.fromMap(json["country"]),
        region: json["region"] == null
            ? null
            : CountryModel.fromMap(json["region"]),
      );

  Map<String, dynamic> toMap() => {
        "country": country == null ? null : country.toMap(),
        "region": region == null ? null : region.toMap(),
      };
}
