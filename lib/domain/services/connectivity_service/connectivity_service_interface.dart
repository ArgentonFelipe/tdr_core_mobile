import 'package:result_dart/result_dart.dart';
import 'package:tdr_core/domain/failures/core_failures.dart';

abstract interface class IConnectivityService {
  Future<Result<Unit, ICoreFailure>> checkConnectivity();
}
