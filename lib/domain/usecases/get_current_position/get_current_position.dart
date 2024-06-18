import 'package:result_dart/result_dart.dart';

import '../../../tdr_core.dart';
import '../../failures/core_failures.dart';
import '../../repositories/geolocator_rest_repository/geolocator_rest_repository_interface.dart';
import '../../services/geolocator_service_interface.dart';

class GetCurrentPosition implements IGetCurrentPosition {
  final IGeolocatorService _geolocatorService;
  final IConnectivityService _connectivityService;
  final IGeolocatorRestRepository _geolocatorRestRepository;

  GetCurrentPosition({
    required IGeolocatorService geolocatorService,
    required IConnectivityService connectivityService,
    required IGeolocatorRestRepository geolocatorRestRepository,
  })  : _geolocatorService = geolocatorService,
        _connectivityService = connectivityService,
        _geolocatorRestRepository = geolocatorRestRepository;

  @override
  Future<Result<Unit, ICoreFailure>> call({required int userId}) async {
    if (userId == 0) {
      return Failure(
        GetCurrentPositionFailure(message: 'Código do Usuário é inválido'),
      );
    }

    final connectivityResult = await _connectivityService.checkConnectivity();
    return connectivityResult.fold((_) async {
      final getResult = await _geolocatorService.getCurrentPosition();
      return getResult.fold((position) async {
        final sendResult = await _geolocatorRestRepository.sendCurrentPossiton(
          position: position,
          userId: userId,
        );
        return sendResult.fold(
          (_) => const Success(unit),
          (failure) => Failure(failure),
        );
      }, (failure) {
        return Failure(failure);
      });
    }, (failure) {
      return Failure(GetCurrentPositionFailure(message: failure.message));
    });
  }
}
