// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_project_home_manager/pages/weather_page/models/clouds.dart';
import 'package:flutter_project_home_manager/pages/weather_page/models/coordinates.dart';
import 'package:flutter_project_home_manager/pages/weather_page/models/weather.dart';
import 'package:flutter_project_home_manager/pages/weather_page/models/weather_main.dart';
import 'package:flutter_project_home_manager/pages/weather_page/models/weather_system.dart';
import 'package:flutter_project_home_manager/pages/weather_page/models/wind.dart';

class WeatherResponse {
  final Coordinates coord;
  final List<Weather> weather;
  final String base;
  final Main main;
  final int visibility;
  final Wind wind;
  final Clouds clouds;
  final int dt;
  final WeatherSystem sys;
  final int id;
  final String name;
  final int cod;
  const WeatherResponse({
    required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.id,
    required this.name,
    required this.cod,
  });

  WeatherResponse copyWith({
    Coordinates? coord,
    List<Weather>? weather,
    String? base,
    Main? main,
    int? visibility,
    Wind? wind,
    Clouds? clouds,
    int? dt,
    WeatherSystem? sys,
    int? id,
    String? name,
    int? cod,
  }) {
    return WeatherResponse(
      coord: coord ?? this.coord,
      weather: weather ?? this.weather,
      base: base ?? this.base,
      main: main ?? this.main,
      visibility: visibility ?? this.visibility,
      wind: wind ?? this.wind,
      clouds: clouds ?? this.clouds,
      dt: dt ?? this.dt,
      sys: sys ?? this.sys,
      id: id ?? this.id,
      name: name ?? this.name,
      cod: cod ?? this.cod,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'coord': coord.toMap(),
      'weather': weather.map((x) => x.toMap()).toList(),
      'base': base,
      'main': main.toMap(),
      'visibility': visibility,
      'wind': wind.toMap(),
      'clouds': clouds.toMap(),
      'dt': dt,
      'sys': sys.toMap(),
      'id': id,
      'name': name,
      'cod': cod,
    };
  }

  factory WeatherResponse.fromMap(Map<String, dynamic> map) {
    return WeatherResponse(
      coord: Coordinates.fromMap(map['coord'] ??
          {
            'lon': 0.0,
            'lat': 0.0,
          }),
      weather: List<Weather>.from(
        (map['weather'] as List<dynamic>).map<Weather>(
          (x) => Weather.fromMap(x ??
              {
                'id': 0,
                'main': '',
                'description': '',
                'icon': '',
              }),
        ),
      ),
      base: map['base'] ?? '',
      main: Main.fromMap(map['main'] ??
          {
            'temp': 0.0,
            'pressure': 0,
            'humidity': 0,
            'tempMin': 0.0,
            'tempMax': 0.0,
          }),
      visibility: map['visibility'] ?? 0,
      wind: Wind.fromMap(map['wind'] ??
          {
            'speed': 0.0,
            'degree': 0,
          }),
      clouds: Clouds.fromMap(map['clouds'] ??
          {
            'all': 0,
          }),
      dt: map['dt'] ?? 0,
      sys: WeatherSystem.fromMap(map['sys'] ??
          {
            'type': 0,
            'id': 0,
            'message': 0.0,
            'country': '',
            'sunrise': 0,
            'sunset': 0,
          }),
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      cod: map['cod'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherResponse.fromJson(String source) =>
      WeatherResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'WeatherResponse(coord: $coord, weather: $weather, base: $base, main: $main, visibility: $visibility, wind: $wind, clouds: $clouds, dt: $dt, sys: $sys, id: $id, name: $name, cod: $cod)';
  }

  @override
  bool operator ==(covariant WeatherResponse other) {
    if (identical(this, other)) return true;

    return other.coord == coord &&
        listEquals(other.weather, weather) &&
        other.base == base &&
        other.main == main &&
        other.visibility == visibility &&
        other.wind == wind &&
        other.clouds == clouds &&
        other.dt == dt &&
        other.sys == sys &&
        other.id == id &&
        other.name == name &&
        other.cod == cod;
  }

  @override
  int get hashCode {
    return coord.hashCode ^
        weather.hashCode ^
        base.hashCode ^
        main.hashCode ^
        visibility.hashCode ^
        wind.hashCode ^
        clouds.hashCode ^
        dt.hashCode ^
        sys.hashCode ^
        id.hashCode ^
        name.hashCode ^
        cod.hashCode;
  }
}
