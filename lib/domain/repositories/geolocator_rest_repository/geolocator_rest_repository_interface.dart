import 'package:result_dart/result_dart.dart';

import '../../entities/position/position.dart';
import '../../failures/core_failures.dart';

abstract interface class IGeolocatorRestRepository {
  Future<Result<Unit, ICoreFailure>> sendCurrentPossiton({
    required Position position,
    required int userId,
    required String url,
  });
}
