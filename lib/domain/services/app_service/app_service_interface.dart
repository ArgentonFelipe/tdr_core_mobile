import 'package:result_dart/result_dart.dart';

import '../../../tdr_core.dart';
import '../../failures/core_failures.dart';

abstract interface class IAppService {
  Future<Result<AppInfo, ICoreFailure>> getAppInfo();
}
