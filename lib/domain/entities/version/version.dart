// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'fields_name/version_fields_name.dart';

class Version extends Equatable {
  final String id;
  final String number;
  final String build;
  final bool isActivated;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const Version({
    required this.id,
    required this.number,
    required this.build,
    required this.isActivated,
    this.createdAt,
    this.updatedAt,
  });

  String get versionNumber => '$number+$build';

  Version copyWith({
    String? id,
    String? number,
    String? build,
    bool? isActivated,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Version(
      id: id ?? this.id,
      number: number ?? this.number,
      build: build ?? this.build,
      isActivated: isActivated ?? this.isActivated,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      VersionFieldsName.id: id,
      VersionFieldsName.number: number,
      VersionFieldsName.build: build,
      VersionFieldsName.createdAt: createdAt,
      VersionFieldsName.updatedAt: updatedAt,
      VersionFieldsName.isActivated: isActivated,
    };
  }

  factory Version.fromMap(Map<String, dynamic> map) {
    return switch (map) {
      {
        VersionFieldsName.build: final String build,
        VersionFieldsName.number: final String number,
      } =>
        Version(
          id: map[VersionFieldsName.id] ?? '',
          number: number,
          build: build,
          isActivated: map[VersionFieldsName.isActivated],
        ),
      _ => throw ArgumentError('Dados do JSON da versão estão incorretos')
    };
  }

  factory Version.empty() {
    return const Version(
      build: '',
      id: '',
      number: '',
      isActivated: false,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      number,
      build,
      isActivated,
      createdAt,
      updatedAt,
    ];
  }
}
