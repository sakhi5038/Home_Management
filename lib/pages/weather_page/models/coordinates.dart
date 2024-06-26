// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Coordinates {
  final double lon;
  final double lat;
  const Coordinates({
    required this.lon,
    required this.lat,
  });

  Coordinates copyWith({
    double? lon,
    double? lat,
  }) {
    return Coordinates(
      lon: lon ?? this.lon,
      lat: lat ?? this.lat,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'lon': lon,
      'lat': lat,
    };
  }

  factory Coordinates.fromMap(Map<String, dynamic> map) {
    return Coordinates(
      lon: map['lon'] ?? 0.0,
      lat: map['lat'] ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Coordinates.fromJson(String source) =>
      Coordinates.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Coordinates(lon: $lon, lat: $lat)';

  @override
  bool operator ==(covariant Coordinates other) {
    if (identical(this, other)) return true;

    return other.lon == lon && other.lat == lat;
  }

  @override
  int get hashCode => lon.hashCode ^ lat.hashCode;
}
