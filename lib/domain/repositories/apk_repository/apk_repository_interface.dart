import 'package:result_dart/result_dart.dart';

import '../../failures/core_failures.dart';

abstract interface class IApkRepository {
  Future<Result<Unit, ICoreFailure>> getApk({
    required String savePath,
    required String apkPath,
  });
}
