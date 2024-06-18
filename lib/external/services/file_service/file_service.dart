import 'package:apk_installer/apk_installer.dart';
import 'package:path_provider/path_provider.dart';
import 'package:result_dart/result_dart.dart';

import '../../../domain/failures/core_failures.dart';
import '../../../domain/services/file_service/file_service_interface.dart';

class FileService implements IFileService {
  @override
  Future<Result<Unit, ICoreFailure>> openFile(String path) async {
    await ApkInstaller.installApk(filePath: path);
    return const Success(unit);
  }

  @override
  Future<Result<String, ICoreFailure>> getPathInTemporaryDirectory({
    required String fileName,
  }) async {
    try {
      final directory = await getExternalStorageDirectory();
      if (directory == null) {
        return Failure(
          FileServiceFailure(
            message:
                'Não conseguimos encontrar a pasta para salvar este arquivo',
          ),
        );
      }
      return Success('${directory.path}/$fileName');
    } on MissingPlatformDirectoryException {
      return Failure(
        FileServiceFailure(
          message: 'Não conseguimos buscar o repositorio de arquivos locais',
        ),
      );
    }
  }
}
