import 'package:flutter/foundation.dart';
import 'package:flutter_project_home_manager/pages/weather_page/models/weather_result.dart';


@immutable
sealed class WeatherApiState {
  const WeatherApiState();
}

@immutable
final class InitialState extends WeatherApiState {}

@immutable
final class WeatherLoadingState extends WeatherApiState {}

@immutable
final class WeatherLoadedState extends WeatherApiState {
  final WeatherResponse weatherInfo;
  const WeatherLoadedState({required this.weatherInfo});
}

@immutable
final class NetworkErrorState extends WeatherApiState {
  final String networkErrorMessage;
  const NetworkErrorState({required this.networkErrorMessage});
}

@immutable
final class ErrorState extends WeatherApiState {
  final String errorMessage;
  const ErrorState({required this.errorMessage});
}

//provider banan hay aur datat fetch kr kay dejhna hay
