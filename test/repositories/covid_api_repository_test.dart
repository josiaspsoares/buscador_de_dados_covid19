import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Dio _dio = Dio();
  String url = "https://corona.lmao.ninja/v2";

  test('Get covid-19 world data', () async {
    Response response = await _dio.get('$url/all');
    expect(response.statusCode, 200);
  });

  test('Get covid-19 country data', () async {
    String country = 'brazil';
    Response response = await _dio.get('$url/countries/$country');
    expect(response.statusCode, 200);
  });
}
