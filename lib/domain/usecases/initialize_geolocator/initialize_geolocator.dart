import 'package:result_dart/result_dart.dart';

import '../../failures/core_failures.dart';
import '../../services/geolocator_service_interface.dart';
import 'initialize_geolocator_interface.dart';

class InitializeGeolocator implements IInitializeGeolocator {
  final IGeolocatorService _geolocatorService;

  InitializeGeolocator({
    required IGeolocatorService geolocatorService,
  }) : _geolocatorService = geolocatorService;

  @override
  Future<Result<Unit, ICoreFailure>> call() async {
    return await _geolocatorService.initialize();
  }
}
