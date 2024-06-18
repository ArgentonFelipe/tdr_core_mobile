import 'dart:async';

import 'package:result_dart/result_dart.dart';

import '../../../domain/failures/core_failures.dart';
import '../../../domain/repositories/apk_repository/apk_repository_interface.dart';
import '../../../tdr_core.dart';

class ApkRepository implements IApkRepository {
  final IRestClient _restClient;

  ApkRepository({required IRestClient restClient}) : _restClient = restClient;

  @override
  Future<Result<Unit, ICoreFailure>> getApk({
    required String savePath,
    required String apkPath,
  }) async {
    try {
      await _restClient.download(
        path: apkPath,
        savePath: savePath,
      );
      return const Success(unit);
    } on TimeoutException {
      return Failure(
        ApkRepositoryFailure(
          message: DefaultFailureMessages.timeout,
        ),
      );
    } on RestClientException catch (failure) {
      return Failure(
        ApkRepositoryFailure(
          message: failure.message ?? DefaultFailureMessages.error,
        ),
      );
    }
  }
}
