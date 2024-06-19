import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:result_dart/result_dart.dart';

import '../../../domain/entities/version/version.dart';
import '../../../domain/failures/core_failures.dart';
import '../../../domain/repositories/version_repository/version_repository_interface.dart';
import '../../../tdr_core.dart';

class VersionRepository implements IVersionRepository {
  final FirebaseFirestore _firebaseFirestore;

  VersionRepository({
    required FirebaseFirestore firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore;

  @override
  Future<Result<Project, ICoreFailure>> getLatestVersion({
    required String packageName,
  }) async {
    try {
      final snapshot = await _firebaseFirestore
          .collection('projects')
          .doc(packageName)
          .get();

      if (!snapshot.exists) {
        return Failure(
          VersionRepositoryFailure(
            message: 'Não encontramos nenhum projeto para este Package Name',
          ),
        );
      }

      final project = Project.fromMap(snapshot.data() ?? {});

      final QuerySnapshot<Map<String, dynamic>>(:docs) =
          await _firebaseFirestore
              .collection('projects')
              .doc(packageName)
              .collection('versions')
              .get();

      final version =
          docs.isNotEmpty ? Version.fromMap(docs.last.data()) : Version.empty();

      return Success(
        project.copyWith(
          id: snapshot.id,
          version: version.copyWith(id: docs.last.id),
        ),
      );
    } on FirebaseException catch (failure) {
      throw VersionRepositoryFailure(
        message: failure.message ?? DefaultFailureMessages.error,
      );
    } on TimeoutException {
      throw VersionRepositoryFailure(
        message: DefaultFailureMessages.timeout,
      );
    }
  }
}
