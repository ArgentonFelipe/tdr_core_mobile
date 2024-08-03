import 'package:result_dart/result_dart.dart';

import '../../entities/position/position.dart';
import '../../failures/core_failures.dart';
import '../../services/geolocator_service_interface.dart';
import 'get_listen_position_interfafce.dart';

class GetListenPosition implements IGetListenPosition {
  final IGeolocatorService _geolocatorService;

  GetListenPosition({
    required IGeolocatorService geolocatorService,
  }) : _geolocatorService = geolocatorService;

  @override
  Result<Stream<Position>, ICoreFailure> call() {
    return _geolocatorService.listemPosition();
  }
}
