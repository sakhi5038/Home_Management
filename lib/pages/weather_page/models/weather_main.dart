// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Main {
  final double temp;
  final int pressure;
  final int humidity;
  final double tempMin;
  final double tempMax;
  Main({
    required this.temp,
    required this.pressure,
    required this.humidity,
    required this.tempMin,
    required this.tempMax,
  });

  Main copyWith({
    double? temp,
    int? pressure,
    int? humidity,
    double? tempMin,
    double? tempMax,
  }) {
    return Main(
      temp: temp ?? this.temp,
      pressure: pressure ?? this.pressure,
      humidity: humidity ?? this.humidity,
      tempMin: tempMin ?? this.tempMin,
      tempMax: tempMax ?? this.tempMax,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'temp': temp,
      'pressure': pressure,
      'humidity': humidity,
      'tempMin': tempMin,
      'tempMax': tempMax,
    };
  }

  factory Main.fromMap(Map<String, dynamic> map) {
    return Main(
      temp: map['temp'] ?? 0.0,
      pressure: map['pressure'] ?? 0,
      humidity: map['humidity'] ?? 0,
      tempMin: map['temp_min'] ?? 0.0,
      tempMax: map['temp_max'] ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Main.fromJson(String source) =>
      Main.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Main(temp: $temp, pressure: $pressure, humidity: $humidity, tempMin: $tempMin, tempMax: $tempMax)';
  }

  @override
  bool operator ==(covariant Main other) {
    if (identical(this, other)) return true;

    return other.temp == temp &&
        other.pressure == pressure &&
        other.humidity == humidity &&
        other.tempMin == tempMin &&
        other.tempMax == tempMax;
  }

  @override
  int get hashCode {
    return temp.hashCode ^
        pressure.hashCode ^
        humidity.hashCode ^
        tempMin.hashCode ^
        tempMax.hashCode;
  }
}
