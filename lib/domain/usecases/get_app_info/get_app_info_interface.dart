import 'package:result_dart/result_dart.dart';
import 'package:tdr_core/domain/failures/core_failures.dart';

import '../../entities/app_info/app_info.dart';

abstract interface class IGetAppInfo {
  Future<Result<AppInfo, ICoreFailure>> call();
}
