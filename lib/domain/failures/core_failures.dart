import 'package:equatable/equatable.dart';

import '../../utils/default_failure_messages/default_failure_messages.dart';
import '../../utils/random_generators/string_random_generator.dart';

abstract interface class ICoreFailure implements Exception {
  final String id;
  final String? message;

  ICoreFailure({required this.id, this.message});
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
