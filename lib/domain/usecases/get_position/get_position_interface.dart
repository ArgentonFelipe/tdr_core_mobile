import 'package:result_dart/result_dart.dart';

import '../../entities/position/position.dart';
import '../../failures/core_failures.dart';

abstract interface class IGetPosition {
  Future<Result<Position, ICoreFailure>> call();
}
