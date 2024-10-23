import 'package:equatable/equatable.dart';

import '../version/version.dart';
import 'fields_name/project_fields_name.dart';

class Project extends Equatable {
  final int id;
  final String name;
  final String packageName;
  final List<Version> versions;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String urlApk;

  const Project({
    required this.id,
    required this.name,
    required this.packageName,
    required this.versions,
    required this.urlApk,
    this.createdAt,
    this.updatedAt,
  });

  String get versionNumber => versions.first.versionNumber;

  @override
  List<Object?> get props {
    return [
      id,
      name,
      packageName,
      versions,
      createdAt,
      updatedAt,
      urlApk,
    ];
  }

  Project copyWith({
    int? id,
    String? name,
    String? packageName,
    List<Version>? versions,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? urlApk,
  }) {
    return Project(
      id: id ?? this.id,
      name: name ?? this.name,
      packageName: packageName ?? this.packageName,
      versions: versions ?? this.versions,
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
      // ProjectFieldsName.versions: versions.toMap(),
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
        // ProjectFieldsName.versions: final Map<String, dynamic> versions,
      } =>
        Project(
          id: map[ProjectFieldsName.id] ?? '',
          name: name,
          urlApk: map[ProjectFieldsName.urlApk] ?? '',
          packageName: packageName,
          versions: map[ProjectFieldsName.versions] != null
              ? map[ProjectFieldsName.versions]
                  .map((version) => Version.fromMap(version))
                  .toList()
              : Version.empty(),
        ),
      _ => throw ArgumentError('Dados do JSON do Projeto estão incorretos'),
    };
  }

  factory Project.empty() {
    return const Project(
      id: 0,
      name: '',
      packageName: '',
      urlApk: '',
      versions: [],
    );
  }
}
