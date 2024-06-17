import 'package:result_dart/result_dart.dart';
import 'package:tdr_core/domain/failures/core_failures.dart';

import '../../entities/position/position.dart';

abstract interface class IGeolocatorRestRepository {
  Future<Result<Unit, ICoreFailure>> sendCurrentPossiton({
    required Position position,
    required int userId,
  });
}
