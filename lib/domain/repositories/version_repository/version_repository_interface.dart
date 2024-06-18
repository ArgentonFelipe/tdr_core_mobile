import 'package:result_dart/result_dart.dart';

import '../../entities/project/project.dart';
import '../../failures/core_failures.dart';

abstract interface class IVersionRepository {
  Future<Result<Project, ICoreFailure>> getLatestVersion({
    required String packageName,
  });
}
