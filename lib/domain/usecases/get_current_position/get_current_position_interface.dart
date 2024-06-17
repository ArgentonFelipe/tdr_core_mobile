import 'package:result_dart/result_dart.dart';

import '../../failures/core_failures.dart';

abstract interface class IGetCurrentPosition {
  Future<Result<Unit, ICoreFailure>> call({required int userId});
}
