import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:result_dart/result_dart.dart';
import 'package:tdr_core/domain/failures/core_failures.dart';

import '../../../domain/services/connectivity_service/connectivity_service_interface.dart';

class ConnectivityService implements IConnectivityService {
  final Connectivity _connectivity;

  const ConnectivityService({
    required Connectivity connectivity,
  }) : _connectivity = connectivity;

  @override
  Future<Result<Unit, ICoreFailure>> checkConnectivity() async {
    final connectivityResults = await _connectivity.checkConnectivity();
    if (connectivityResults.isNotEmpty) {
      return const Success(unit);
    }

    return Failure(OfflineDeviceFailure());
  }
}
