import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_project_home_manager/services/weather_services/data_repository.dart';
import 'package:flutter_project_home_manager/pages/weather_page/controller/states.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WeatherNotifier extends Notifier<WeatherApiState> {
  static const _errorMessage = 'Somethig Went Wrong!';
  final TextEditingController weatherController = TextEditingController();
  @override
  WeatherApiState build() {
    ref.onDispose(
      () {
        weatherController.dispose();
      },
    );
    return InitialState();
  }

  Color currentColor = Colors.white;

  void fetchWeather() async {
    state = WeatherLoadingState();
    try {
      var record = await WeatherRepository()
          .getWeatherInfo(cityName: weatherController.text);
      if (record.$1 == null) {
        state = NetworkErrorState(networkErrorMessage: record.$2!);
      } else {
        state = WeatherLoadedState(weatherInfo: record.$1!);
      }
    } catch (e) {
      state = const ErrorState(errorMessage: _errorMessage);
      log(e.toString());
    }
  }
}

final weatherProvider =
    NotifierProvider<WeatherNotifier, WeatherApiState>(WeatherNotifier.new);
