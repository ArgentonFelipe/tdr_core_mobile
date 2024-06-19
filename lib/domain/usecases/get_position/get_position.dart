import 'package:result_dart/result_dart.dart';

import '../../entities/position/position.dart';
import '../../failures/core_failures.dart';
import '../../services/geolocator_service_interface.dart';
import 'get_position_interface.dart';

class GetPosition implements IGetPosition {
  final IGeolocatorService _geolocatorService;

  GetPosition({
    required IGeolocatorService geolocatorService,
  }) : _geolocatorService = geolocatorService;

  @override
  Future<Result<Position, ICoreFailure>> call() {
    return _geolocatorService.getCurrentPosition();
  }
}
