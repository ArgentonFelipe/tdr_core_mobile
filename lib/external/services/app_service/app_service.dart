import 'package:result_dart/result_dart.dart';

import '../../../domain/entities/app_info/app_info.dart';
import '../../../domain/failures/core_failures.dart';
import '../../../domain/services/app_service/app_service_interface.dart';
import '../../helpers/package_info_wrapper/package_info_wrapper_interface.dart';

class AppService implements IAppService {
  final IPackageInfoWrapper _packageInfoWrapper;

  const AppService({
    required IPackageInfoWrapper packageInfoWrapper,
  }) : _packageInfoWrapper = packageInfoWrapper;

  @override
  Future<Result<AppInfo, ICoreFailure>> getAppInfo() async {
    await _packageInfoWrapper.init();
    final version = _packageInfoWrapper.version;
    if (version.isEmpty) {
      return Failure(
        AppServiceFailure(
          message: 'Não foi possível capturar a versão do aplicativo',
        ),
      );
    }
    final buildNumber = _packageInfoWrapper.buildNumber;
    if (buildNumber.isEmpty) {
      return Failure(
        AppServiceFailure(
          message: 'Não foi possível capturar o buildNumber do aplicativo',
        ),
      );
    }
    final packageName = _packageInfoWrapper.packageName;
    if (packageName.isEmpty) {
      return Failure(
        AppServiceFailure(
          message: 'Não foi possível capturar o packageName do aplicativo',
        ),
      );
    }
    return Success(
      AppInfo(
        buildNumber: buildNumber,
        version: version,
        packageName: packageName,
      ),
    );
  }
}
