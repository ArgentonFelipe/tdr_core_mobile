import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:result_dart/result_dart.dart';

import '../../../domain/entities/position/position.dart' as entity;
import '../../../domain/failures/core_failures.dart';
import '../../../domain/services/geolocator_service_interface.dart';
import '../../../tdr_core.dart';

class GeolocatorService implements IGeolocatorService {
  @override
  Future<Result<Unit, ICoreFailure>> initialize() async {
    try {
      final isServiceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!isServiceEnabled) {
        return Failure(
          GeolocatorServiceFailure(
            message:
                'Notamos que o seu dispositivo não esta com o sistema de localização ativado',
          ),
        );
      }

      final permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        final requestPemission = await Geolocator.requestPermission();
        if (requestPemission == LocationPermission.denied) {
          return Failure(
            GeolocatorServiceFailure(
              message:
                  'Notamos que as permissões de Localização foram Negadas. O aplicativo precisa acessar a Localização para funcionar corretamente',
            ),
          );
        }
      } else if (permission == LocationPermission.deniedForever) {
        return Failure(
          GeolocatorServiceFailure(
            message:
                'Notamos que as Permissões de Localização foram negadas para sempre. O aplicativo precisa acessar a Localização para funcionar corretamente',
          ),
        );
      }
      return const Success(unit);
    } on TimeoutException {
      return Failure(
        GeolocatorServiceFailure(
          message: DefaultFailureMessages.timeout,
        ),
      );
    }
  }

  @override
  Future<Result<entity.Position, ICoreFailure>> getCurrentPosition() async {
    try {
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      return Success(
        entity.Position(
          latitude: position.latitude,
          longitude: position.longitude,
          altitude: position.altitude,
          altitudeAccuracy: position.altitudeAccuracy,
          accuracy: position.accuracy,
          speed: position.speed,
          speedAccuracy: position.speedAccuracy,
          createdAt: position.timestamp,
        ),
      );
    } on TimeoutException {
      return Failure(
        GeolocatorServiceFailure(
          message: DefaultFailureMessages.timeout,
        ),
      );
    }
  }
}
