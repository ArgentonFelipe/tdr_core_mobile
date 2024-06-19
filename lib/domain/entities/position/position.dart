// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'fields_name/position_fields_name.dart';

class Position extends Equatable {
  final double latitude;
  final double longitude;
  final double altitude;
  final double altitudeAccuracy;
  final double accuracy;
  final double speed;
  final double speedAccuracy;
  final DateTime createdAt;

  const Position({
    required this.latitude,
    required this.longitude,
    required this.altitude,
    required this.altitudeAccuracy,
    required this.accuracy,
    required this.speed,
    required this.speedAccuracy,
    required this.createdAt,
  });

  Position copyWith({
    double? latitude,
    double? longitude,
    double? altitude,
    double? altitudeAccuracy,
    double? accuracy,
    double? speed,
    double? speedAccuracy,
    DateTime? createdAt,
  }) {
    return Position(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      altitude: altitude ?? this.altitude,
      altitudeAccuracy: altitudeAccuracy ?? this.altitudeAccuracy,
      accuracy: accuracy ?? this.accuracy,
      speed: speed ?? this.speed,
      speedAccuracy: speedAccuracy ?? this.speedAccuracy,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> objectToMap() {
    return <String, dynamic>{
      PositionFieldsName.latitude: latitude,
      PositionFieldsName.longitude: longitude,
      PositionFieldsName.altitude: altitude,
    };
  }

  factory Position.mapToObject(Map<String, dynamic> map) {
    return switch (map) {
      {
        PositionFieldsName.latitude: final double latitude,
        PositionFieldsName.longitude: final double longitude,
        PositionFieldsName.altitude: final double altitude,
        PositionFieldsName.altitudeAccuracy: final double altitudeAccuracy,
        PositionFieldsName.accuracy: final double accuracy,
        PositionFieldsName.speed: final double speed,
        PositionFieldsName.speedAccuracy: final double speedAccuracy,
        PositionFieldsName.createdAt: final DateTime createdAt,
      } =>
        Position(
          latitude: latitude,
          longitude: longitude,
          altitude: altitude,
          altitudeAccuracy: altitudeAccuracy,
          accuracy: accuracy,
          speed: speed,
          speedAccuracy: speedAccuracy,
          createdAt: createdAt,
        ),
      _ => throw ArgumentError('Dados da Posição do Dispositivo são inválidos'),
    };
  }

  @override
  List<Object> get props {
    return [
      latitude,
      longitude,
      altitude,
      altitudeAccuracy,
      accuracy,
      speed,
      speedAccuracy,
      createdAt,
    ];
  }
}
