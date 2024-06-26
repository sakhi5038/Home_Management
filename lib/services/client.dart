import 'dart:convert';

import 'package:flutter_project_home_manager/pages/weather_page/models/weather_result.dart';
import 'package:http/http.dart';

extension ApiResponse on Response {
  bool get isSuccessFul => statusCode == 200;
}

abstract interface class WeatherApiService {
  String get _baseUrl => 'http://api.openweathermap.org/data/2.5';
  String get apiUrl;
  String get url => _baseUrl + apiUrl;

  dynamic fetch({required String endPoint}) async {
    var response = await get(Uri.parse('$url$endPoint'));
    return response.isSuccessFul ? jsonDecode(response.body) : null;
  }
}

class CityWeatherService extends WeatherApiService {
  @override
  String get apiUrl => '/weather';

  Future<WeatherResponse> fetchWeather({required String cityName}) async {
    var endPoint = '?q=$cityName&appid=098dffd446ed3c1a648c87b0673268dc';
    var mapOfWeather = await fetch(endPoint: endPoint);
    return WeatherResponse.fromMap(mapOfWeather);
  }
}
