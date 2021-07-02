import 'package:covid19/models/country_model.dart';
import 'package:covid19/models/world_model.dart';
import 'package:dio/dio.dart';

class CovidApiRepository {
  final Dio _dio = Dio();
  String url = "https://corona.lmao.ninja/v2";

  Future<WorldModel> getWorldData() async {
    Response response = await _dio.get('$url/all');

    if (response.statusCode != 200) {
      throw Exception();
    } else {
      return WorldModel.fromMap(response.data);
    }
  }

  Future<CountryModel> getCountryData({required String country}) async {
    Response response = await _dio.get('$url/countries/$country');

    if (response.statusCode != 200) {
      throw Exception();
    } else {
      return CountryModel.fromMap(response.data);
    }
  }
}
