import 'package:result_dart/result_dart.dart';
import 'package:tdr_core/tdr_core.dart';

import '../../failures/core_failures.dart';

abstract interface class IGetDeviceInfo {
  Future<Result<DeviceInfo, ICoreFailure>> call();
}
