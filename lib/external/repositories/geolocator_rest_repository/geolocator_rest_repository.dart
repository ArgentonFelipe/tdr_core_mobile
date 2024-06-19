import 'dart:async';
import 'dart:developer';

import 'package:result_dart/result_dart.dart';

import '../../../domain/failures/core_failures.dart';
import '../../../domain/repositories/geolocator_rest_repository/geolocator_rest_repository_interface.dart';
import '../../../tdr_core.dart';

class GeolocatorRestRepository implements IGeolocatorRestRepository {
  final IRestClient _restClient;

  GeolocatorRestRepository({
    required IRestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<Result<Unit, ICoreFailure>> sendCurrentPossiton({
    required Position position,
    required int userId,
    required String url,
  }) async {
    try {
      final data = position.objectToMap();
      data['AUDITOR_CODIGO'] = userId;

      log(data.toString());

      await _restClient.auth.post(
        url,
        data: data,
      );
      return const Success(unit);
    } on TimeoutException {
      return Failure(
        GeolocatorRestRepositoryFailure(
          message: DefaultFailureMessages.timeout,
        ),
      );
    } on RestClientException catch (failure) {
      return Failure(
        GeolocatorRestRepositoryFailure(message: failure.message),
      );
    }
  }
}
