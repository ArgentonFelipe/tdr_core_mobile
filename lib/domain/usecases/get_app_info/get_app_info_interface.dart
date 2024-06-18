import 'package:result_dart/result_dart.dart';

import '../../entities/app_info/app_info.dart';
import '../../failures/core_failures.dart';

abstract interface class IGetAppInfo {
  Future<Result<AppInfo, ICoreFailure>> call();
}
