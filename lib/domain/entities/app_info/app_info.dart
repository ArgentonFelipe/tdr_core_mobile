import 'package:equatable/equatable.dart';

class AppInfo extends Equatable {
  final String buildNumber;
  final String version;
  final String packageName;

  const AppInfo({
    required this.buildNumber,
    required this.version,
    required this.packageName,
  });

  factory AppInfo.empty() {
    return const AppInfo(
      buildNumber: '',
      version: '',
      packageName: '',
    );
  }

  String get versionNumber => '$version+$buildNumber';

  @override
  List<Object> get props => [buildNumber, version, packageName];
}
