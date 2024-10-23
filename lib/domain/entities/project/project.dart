// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import '../version/version.dart';
import 'fields_name/project_fields_name.dart';

class Project extends Equatable {
  final int id;
  final String name;
  final String packageName;
  final Version version;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String urlApk;

  const Project({
    required this.id,
    required this.name,
    required this.packageName,
    required this.version,
    required this.urlApk,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props {
    return [
      id,
      name,
      packageName,
      version,
      createdAt,
      updatedAt,
      urlApk,
    ];
  }

  String get versionNumber => '${this.version.number}+${this.version.build}';

  Project copyWith({
    int? id,
    String? name,
    String? packageName,
    Version? version,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? urlApk,
  }) {
    return Project(
      id: id ?? this.id,
      name: name ?? this.name,
      packageName: packageName ?? this.packageName,
      version: version ?? this.version,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      urlApk: urlApk ?? this.urlApk,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      ProjectFieldsName.id: id,
      ProjectFieldsName.name: name,
      ProjectFieldsName.packageName: packageName,
      ProjectFieldsName.version: version.toMap(),
      ProjectFieldsName.urlApk: urlApk,

      // ProjectFieldsName.createdAt: createdAt?.millisecondsSinceEpoch,
      // ProjectFieldsName.updatedAt: updatedAt?.millisecondsSinceEpoch,
    };
  }

  factory Project.fromMap(Map<String, dynamic> map) {
    return switch (map) {
      {
        ProjectFieldsName.name: final String name,
        ProjectFieldsName.packageName: final String packageName,
        // ProjectFieldsName.urlApk: final String urlApk,
        // ProjectFieldsName.version: final Map<String, dynamic> version,
      } =>
        Project(
          id: map[ProjectFieldsName.id] ?? '',
          name: name,
          urlApk: map[ProjectFieldsName.urlApk] ?? '',
          packageName: packageName,
          version: map[ProjectFieldsName.version] != null
              ? Version.fromMap(map[ProjectFieldsName.version])
              : Version.empty(),
        ),
      _ => throw ArgumentError('Dados do JSON do Projeto estão incorretos'),
    };
  }

  factory Project.empty() {
    return Project(
      id: 0,
      name: '',
      packageName: '',
      urlApk: '',
      version: Version.empty(),
    );
  }
}
