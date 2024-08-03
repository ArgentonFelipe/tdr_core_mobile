import 'dart:async';

import 'package:result_dart/result_dart.dart';

import '../entities/position/position.dart';
import '../failures/core_failures.dart';

abstract interface class IGeolocatorService {
  Future<Result<Unit, ICoreFailure>> initialize();
  Future<Result<Position, ICoreFailure>> getCurrentPosition();
  Result<Stream<Position>, ICoreFailure> listemPosition();
}
