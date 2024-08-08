// import 'package:package_info_plus/package_info_plus.dart';

import 'package_info_wrapper_interface.dart';

class PackageInfoWrapper implements IPackageInfoWrapper {
  // PackageInfo? _packageInfo;

  @override
  Future<void> init() async {
    // _packageInfo = await PackageInfo.fromPlatform();
  }

  @override
  // String get version => _packageInfo?.version ?? '';
  String get version => '';

  @override
  // String get buildNumber => _packageInfo?.buildNumber ?? '';
  String get buildNumber => '';

  @override
  String get packageName => '';
  // String get packageName => _packageInfo?.packageName ?? '';

  @override
  String get appName => '';
  // String get appName => _packageInfo?.appName ?? '';
}
