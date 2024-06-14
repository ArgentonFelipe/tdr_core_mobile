abstract interface class IPackageInfoWrapper {
  Future<void> init();
  String get version;
  String get buildNumber;
  String get packageName;
  String get appName;
}
