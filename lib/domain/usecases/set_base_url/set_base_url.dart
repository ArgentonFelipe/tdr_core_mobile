import 'package:result_dart/result_dart.dart';

import '../../failures/core_failures.dart';
import '../../repositories/configuration_rest_repository/configuration_rest_repository_interface.dart';
import 'set_base_url_interface.dart';

class SetBaseUrl implements ISetBaseUrl {
  final IConfigurationRestRepository _configurationRestRepository;

  SetBaseUrl({
    required IConfigurationRestRepository configurationRestRepository,
  }) : _configurationRestRepository = configurationRestRepository;

  @override
  Result<Unit, ICoreFailure> call(String url) {
    return _configurationRestRepository.setBaseUrl(url);
  }
}
