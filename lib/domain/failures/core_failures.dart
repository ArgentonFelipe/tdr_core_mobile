import 'package:equatable/equatable.dart';

import '../../utils/default_failure_messages/default_failure_messages.dart';
import '../../utils/random_generators/string_random_generator.dart';

abstract interface class ICoreFailure implements Exception {
  final String id;
  final String? message;

  ICoreFailure({required this.id, this.message});
}

class FileServiceFailure extends Equatable implements ICoreFailure {
  @override
  final String message;
  @override
  final String id = StringRandomGenerator().getRandomString(10);

  FileServiceFailure({required this.message});
  @override
  List<Object> get props => [id, message];
}

class OfflineDeviceFailure extends Equatable implements ICoreFailure {
  @override
  final String id = StringRandomGenerator().getRandomString(10);

  @override
  final String? message = DefaultFailureMessages.offline;

  OfflineDeviceFailure();

  @override
  List<Object> get props => [id];
}

class ApkRepositoryFailure extends Equatable implements ICoreFailure {
  @override
  final String message;
  @override
  final String id = StringRandomGenerator().getRandomString(10);

  ApkRepositoryFailure({required this.message});
  @override
  List<Object> get props => [id, message];
}

class AppServiceFailure extends Equatable implements ICoreFailure {
  @override
  final String id = StringRandomGenerator().getRandomString(10);

  @override
  final String? message;

  AppServiceFailure({this.message});

  @override
  List<Object> get props => [id];
}

class DeviceServiceFailure extends Equatable implements ICoreFailure {
  @override
  final String id = StringRandomGenerator().getRandomString(10);

  @override
  final String? message;

  DeviceServiceFailure({this.message});

  @override
  List<Object> get props => [id];
}

class GetCurrentPositionFailure extends Equatable implements ICoreFailure {
  @override
  final String id = StringRandomGenerator().getRandomString(10);

  @override
  final String? message;

  GetCurrentPositionFailure({this.message});

  @override
  List<Object> get props => [id];
}

class GeolocatorRestRepositoryFailure extends Equatable
    implements ICoreFailure {
  @override
  final String id = StringRandomGenerator().getRandomString(10);

  @override
  final String? message;

  GeolocatorRestRepositoryFailure({this.message});

  @override
  List<Object> get props => [id];
}

class GeolocatorServiceFailure extends Equatable implements ICoreFailure {
  @override
  final String id = StringRandomGenerator().getRandomString(10);

  @override
  final String? message;

  GeolocatorServiceFailure({this.message});

  @override
  List<Object> get props => [id];
}

class UpdateAppFailure extends Equatable implements ICoreFailure {
  @override
  final String id = StringRandomGenerator().getRandomString(10);

  @override
  final String? message;

  UpdateAppFailure({this.message});

  @override
  List<Object> get props => [id];
}

class VersionRepositoryFailure extends Equatable implements ICoreFailure {
  @override
  final String id = StringRandomGenerator().getRandomString(10);

  @override
  final String? message;

  VersionRepositoryFailure({this.message});

  @override
  List<Object> get props => [id];
}

class GetProjectLatestVersionFailure extends Equatable implements ICoreFailure {
  @override
  final String id = StringRandomGenerator().getRandomString(10);

  @override
  final String? message;

  GetProjectLatestVersionFailure({this.message});

  @override
  List<Object> get props => [id];
}

class OutdatedProjectVersionFailure extends Equatable implements ICoreFailure {
  @override
  final String id = StringRandomGenerator().getRandomString(10);

  @override
  final String? message;

  OutdatedProjectVersionFailure({this.message});

  @override
  List<Object> get props => [id];
}
