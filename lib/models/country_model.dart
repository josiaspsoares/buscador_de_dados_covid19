import 'dart:convert';

import 'package:covid19/models/world_model.dart';

class CountryModel extends WorldModel {
  String country;
  int todayDeaths;
  int critical;
  String urlFlag;

  CountryModel({
    required int cases,
    required int deaths,
    required int recovered,
    required this.country,
    required this.todayDeaths,
    required this.critical,
    required this.urlFlag,
  }) : super(cases: cases, deaths: deaths, recovered: recovered);

  factory CountryModel.fromMap(Map<String, dynamic> map) {
    return CountryModel(
      cases: map['cases'],
      deaths: map['deaths'],
      recovered: map['recovered'],
      country: map['country'],
      todayDeaths: map['todayDeaths'],
      critical: map['critical'],
      urlFlag: map['countryInfo']['flag'],
    );
  }

  factory CountryModel.fromJson(String source) =>
      CountryModel.fromMap(json.decode(source));
}
