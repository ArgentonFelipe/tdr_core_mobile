import 'package:result_dart/result_dart.dart';

import '../../../tdr_core.dart';
import '../../failures/core_failures.dart';
import '../../repositories/version_repository/version_repository_interface.dart';
import '../../services/app_service/app_service_interface.dart';

class CheckProjectLatestVersion implements ICheckProjectLatestVersion {
  final IConnectivityService _connectivityService;
  final IAppService _appService;
  final IVersionRepository _versionRepository;

  CheckProjectLatestVersion({
    required IConnectivityService connectivityService,
    required IAppService appService,
    required IVersionRepository versionRepository,
  })  : _connectivityService = connectivityService,
        _appService = appService,
        _versionRepository = versionRepository;

  @override
  Future<Result<({Project project, bool needUpdateVersion}), ICoreFailure>>
      call() async {
    final connectiviryResult = await _connectivityService.isOnlyWifi();
    return connectiviryResult.fold(
      (_) async {
        final getInfoResult = await _appService.getAppInfo();
        return getInfoResult.fold((appInfo) async {
          final getResult = await _versionRepository.getLatestVersion(
            packageName: appInfo.packageName,
          );
          return getResult.fold(
            (project) {
              if (appInfo.versionNumber.compareTo(project.versionNumber) != 0) {
                // return Failure(
                //   OutdatedProjectVersionFailure(
                //     message:
                //         'Notamos que seu aplicativo esta com uma versão antiga.\n\r Ultima Versão: ${project.versionNumber}',
                //   ),
                // );
                return Success((project: project, needUpdateVersion: true));
              }
              return Success((project: project, needUpdateVersion: false));
            },
            (failure) {
              return Failure(
                GetProjectLatestVersionFailure(message: failure.message),
              );
            },
          );
        }, (failure) {
          return Failure(
            GetProjectLatestVersionFailure(message: failure.message),
          );
        });
      },
      (failure) {
        return Failure(
          GetProjectLatestVersionFailure(message: failure.message),
        );
      },
    );
  }
}
