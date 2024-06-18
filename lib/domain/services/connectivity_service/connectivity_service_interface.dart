import 'package:result_dart/result_dart.dart';

import '../../failures/core_failures.dart';

abstract interface class IConnectivityService {
  Future<Result<Unit, ICoreFailure>> checkConnectivity();
  Future<Result<Unit, ICoreFailure>> isOnlyWifi();
}
