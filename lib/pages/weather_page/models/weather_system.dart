// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class WeatherSystem {
  final int type;
  final int id;
  final double message;
  final String country;
  final int sunrise;
  final int sunset;

  const WeatherSystem({
    required this.type,
    required this.id,
    required this.message,
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  WeatherSystem copyWith({
    int? type,
    int? id,
    double? message,
    String? country,
    int? sunrise,
    int? sunset,
  }) {
    return WeatherSystem(
      type: type ?? this.type,
      id: id ?? this.id,
      message: message ?? this.message,
      country: country ?? this.country,
      sunrise: sunrise ?? this.sunrise,
      sunset: sunset ?? this.sunset,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type,
      'id': id,
      'message': message,
      'country': country,
      'sunrise': sunrise,
      'sunset': sunset,
    };
  }

  factory WeatherSystem.fromMap(Map<String, dynamic> map) {
    return WeatherSystem(
      type: map['type'] ?? 0,
      id: map['id'] ?? 0,
      message: map['message'] ?? 0.0,
      country: map['country'] ?? '',
      sunrise: map['sunrise'] ?? 0,
      sunset: map['sunset'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherSystem.fromJson(String source) =>
      WeatherSystem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'WeatherSystem(type: $type, id: $id, message: $message, country: $country, sunrise: $sunrise, sunset: $sunset)';
  }

  @override
  bool operator ==(covariant WeatherSystem other) {
    if (identical(this, other)) return true;

    return other.type == type &&
        other.id == id &&
        other.message == message &&
        other.country == country &&
        other.sunrise == sunrise &&
        other.sunset == sunset;
  }

  @override
  int get hashCode {
    return type.hashCode ^
        id.hashCode ^
        message.hashCode ^
        country.hashCode ^
        sunrise.hashCode ^
        sunset.hashCode;
  }
}
