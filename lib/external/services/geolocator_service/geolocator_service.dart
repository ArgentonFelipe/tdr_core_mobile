import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart' as geolocator;
import 'package:result_dart/result_dart.dart';

import '../../../domain/entities/position/position.dart' as entity;
import '../../../domain/failures/core_failures.dart';
import '../../../domain/services/geolocator_service_interface.dart';
import '../../../tdr_core.dart';

class GeolocatorService implements IGeolocatorService {
  late geolocator.LocationSettings locationSettings;
  @override
  Future<Result<Unit, ICoreFailure>> initialize() async {
    try {
      final isServiceEnabled =
          await geolocator.Geolocator.isLocationServiceEnabled();
      if (!isServiceEnabled) {
        return Failure(
          GeolocatorServiceFailure(
            message:
                'Notamos que o seu dispositivo não esta com o sistema de localização ativado',
          ),
        );
      }

      final permission = await geolocator.Geolocator.checkPermission();
      if (permission == geolocator.LocationPermission.denied) {
        final requestPemission =
            await geolocator.Geolocator.requestPermission();
        if (requestPemission == geolocator.LocationPermission.denied) {
          return Failure(
            GeolocatorServiceFailure(
              message:
                  'Notamos que as permissões de Localização foram Negadas. O aplicativo precisa acessar a Localização para funcionar corretamente',
            ),
          );
        }
      } else if (permission == geolocator.LocationPermission.deniedForever) {
        return Failure(
          GeolocatorServiceFailure(
            message:
                'Notamos que as Permissões de Localização foram negadas para sempre. O aplicativo precisa acessar a Localização para funcionar corretamente',
          ),
        );
      }
      locationSettings = initializeLocalSettings();

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
      final position = await geolocator.Geolocator.getCurrentPosition(
        desiredAccuracy: geolocator.LocationAccuracy.high,
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

  @override
  Result<Stream<entity.Position>, ICoreFailure> listemPosition() {
    return Success(
      geolocator.Geolocator.getPositionStream(
        locationSettings: locationSettings,
      ).transform(
        StreamTransformer<geolocator.Position, entity.Position>.fromHandlers(
          handleData: (position, sink) {
            sink.add(
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
          },
        ),
      ),
    );
  }

  @visibleForTesting
  geolocator.LocationSettings initializeLocalSettings() {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return geolocator.AndroidSettings(
        accuracy: geolocator.LocationAccuracy.high,
        distanceFilter: 100,
        forceLocationManager: true,
        intervalDuration: const Duration(seconds: 10),
        foregroundNotificationConfig:
            const geolocator.ForegroundNotificationConfig(
          notificationText:
              "Example app will continue to receive your location even when you aren't using it",
          notificationTitle: 'Running in Background',
          enableWakeLock: true,
        ),
      );
    } else if (defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.macOS) {
      return geolocator.AppleSettings(
        accuracy: geolocator.LocationAccuracy.high,
        activityType: geolocator.ActivityType.fitness,
        distanceFilter: 100,
        pauseLocationUpdatesAutomatically: true,
        showBackgroundLocationIndicator: false,
      );
    } else {
      return const geolocator.LocationSettings(
        accuracy: geolocator.LocationAccuracy.high,
        distanceFilter: 100,
      );
    }
  }
}
