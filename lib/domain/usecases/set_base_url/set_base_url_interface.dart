import 'package:result_dart/result_dart.dart';

import '../../failures/core_failures.dart';

abstract interface class ISetBaseUrl {
  Result<Unit, ICoreFailure> call(String url);
}
