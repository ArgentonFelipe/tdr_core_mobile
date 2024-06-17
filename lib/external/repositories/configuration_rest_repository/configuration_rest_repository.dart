import 'package:result_dart/result_dart.dart';
import 'package:tdr_core/domain/failures/core_failures.dart';
import 'package:tdr_core/tdr_core.dart';

import '../../../domain/repositories/configuration_rest_repository/configuration_rest_repository_interface.dart';

class ConfigurationRestRepository implements IConfigurationRestRepository {
  final IRestClient _restClient;

  ConfigurationRestRepository({
    required IRestClient restClient,
  }) : _restClient = restClient;

  @override
  Result<Unit, ICoreFailure> setBaseUrl(String url) {
    _restClient.setBaseUrl(url);
    return const Success(unit);
  }
}
