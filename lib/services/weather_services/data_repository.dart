import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_project_home_manager/services/client.dart';
import 'package:flutter_project_home_manager/pages/weather_page/models/weather_result.dart';


class WeatherRepository {
  Future<(WeatherResponse?, String?)> getWeatherInfo(
      {required String cityName}) async {
    final connectivityResults = await Connectivity().checkConnectivity();
    if (connectivityResults.contains(ConnectivityResult.wifi) ||
        connectivityResults.contains(ConnectivityResult.mobile)) {
      //Service
      CityWeatherService cityWeatherService = CityWeatherService();
      var weather = await cityWeatherService.fetchWeather(cityName: cityName);
      return (weather, null);
    } else {
      return (null, 'No Internet Connection');
    }
  }
}
