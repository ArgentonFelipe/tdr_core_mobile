import '../../../../domain/entities/app_info/app_info.dart';

class AppInfoStore {
  AppInfo _appInfo = AppInfo.empty();

  void setAppInfo(AppInfo appInfo) => _appInfo = appInfo;

  String get buildNumber => _appInfo.buildNumber;
  String get packageName => _appInfo.packageName;
  String get version => _appInfo.version;
}
