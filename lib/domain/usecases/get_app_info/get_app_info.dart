import 'package:result_dart/result_dart.dart';

import '../../entities/app_info/app_info.dart';
import '../../failures/core_failures.dart';
import '../../services/app_service/app_service_interface.dart';
import 'get_app_info_interface.dart';

class GetAppInfo implements IGetAppInfo {
  final IAppService _appService;

  GetAppInfo({
    required IAppService appService,
  }) : _appService = appService;

  @override
  Future<Result<AppInfo, ICoreFailure>> call() async {
    return await _appService.getAppInfo();
  }
}
