import 'package:result_dart/result_dart.dart';
import 'package:tdr_core/domain/failures/core_failures.dart';

import '../entities/position/position.dart';

abstract interface class IGeolocatorService {
  Future<Result<Unit, ICoreFailure>> initialize();
  Future<Result<Position, ICoreFailure>> getCurrentPosition();
}
