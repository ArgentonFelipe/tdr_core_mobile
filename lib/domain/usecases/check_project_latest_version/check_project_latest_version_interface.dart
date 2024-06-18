import 'package:result_dart/result_dart.dart';

import '../../entities/project/project.dart';
import '../../failures/core_failures.dart';

abstract interface class ICheckProjectLatestVersion {
  Future<Result<({Project project, bool needUpdateVersion}), ICoreFailure>>
      call();
}
