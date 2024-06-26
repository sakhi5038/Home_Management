// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Wind {
  final double speed;
  final int degree;
  Wind({
    required this.speed,
    required this.degree,
  });

  Wind copyWith({
    double? speed,
    int? degree,
  }) {
    return Wind(
      speed: speed ?? this.speed,
      degree: degree ?? this.degree,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'speed': speed,
      'degree': degree,
    };
  }

  factory Wind.fromMap(Map<String, dynamic> map) {
    return Wind(
      speed: map['speed'] ?? 0.0,
      degree: map['degree'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Wind.fromJson(String source) =>
      Wind.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Wind(speed: $speed, degree: $degree)';

  @override
  bool operator ==(covariant Wind other) {
    if (identical(this, other)) return true;

    return other.speed == speed && other.degree == degree;
  }

  @override
  int get hashCode => speed.hashCode ^ degree.hashCode;
}
