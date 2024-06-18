import 'package:result_dart/result_dart.dart';

import '../../failures/core_failures.dart';

abstract interface class IFileService {
  Future<Result<Unit, ICoreFailure>> openFile(String path);
  Future<Result<String, ICoreFailure>> getPathInTemporaryDirectory({
    required String fileName,
  });
}
