import 'package:flutter/material.dart';

import '../../../tdr_core.dart';

class AppVersionInformations extends StatelessWidget {
  final String appVersion;

  const AppVersionInformations({
    super.key,
    required this.appVersion,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      this.appVersion,
      textAlign: TextAlign.center,
      style: TextStyleApp.body.copyWith(color: Colors.white),
    );
  }
}
