import 'dart:convert';

class WorldModel {
  int cases;
  int deaths;
  int recovered;
  int? affectedCountries;
  DateTime? updated;

  WorldModel({
    required this.cases,
    required this.deaths,
    required this.recovered,
    this.affectedCountries,
    this.updated,
  });

  factory WorldModel.fromMap(Map<String, dynamic> map) {
    return WorldModel(
      cases: map['cases'],
      deaths: map['deaths'],
      recovered: map['recovered'],
      affectedCountries: map['affectedCountries'],
      updated: DateTime.fromMillisecondsSinceEpoch(map['updated']),
    );
  }

  factory WorldModel.fromJson(String source) => WorldModel.fromMap(json.decode(source));
}
