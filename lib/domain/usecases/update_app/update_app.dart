import 'package:result_dart/result_dart.dart';

import '../../../tdr_core.dart';
import '../../failures/core_failures.dart';
import '../../repositories/apk_repository/apk_repository_interface.dart';
import '../../services/file_service/file_service_interface.dart';

class UpdateApp implements IUpdateApp {
  final IConnectivityService _connectivityService;
  final IApkRepository _apkRepository;
  final IFileService _fileService;

  UpdateApp({
    required IConnectivityService connectivityService,
    required IApkRepository apkRepository,
    required IFileService fileService,
  })  : _connectivityService = connectivityService,
        _apkRepository = apkRepository,
        _fileService = fileService;

  @override
  Future<Result<Unit, ICoreFailure>> call({required String apkUrl}) async {
    final connectivityResult = await _connectivityService.isOnlyWifi();
    return connectivityResult.fold((_) async {
      final getPathResult = await _fileService.getPathInTemporaryDirectory(
        fileName: 'app.apk',
      );
      return getPathResult.fold((path) async {
        final getResult = await _apkRepository.getApk(
          apkPath: apkUrl,
          savePath: path,
        );
        return getResult.fold((_) async {
          final openResult = await _fileService.openFile(path);
          return openResult.fold((_) {
            return const Success(unit);
          }, (failure) {
            return Failure(failure);
          });
        }, (failure) {
          return Failure(failure);
        });
      }, (failure) {
        return Failure(failure);
      });
    }, (failure) {
      return Failure(UpdateAppFailure(message: failure.message));
    });
  }
}
