import 'package:flutter/material.dart';

import '../../../tdr_core.dart';

final class TextStyleApp {
  static const appFont = 'Montserrat';

  static const title = TextStyle(
    fontFamily: appFont,
    fontWeight: FontWeight.bold,
    fontSize: 14,
    color: Colors.black,
  );
  static const subtitle = TextStyle(
    fontFamily: appFont,
    fontWeight: FontWeight.bold,
    fontSize: 12,
    color: Colors.black,
  );

  static const button = TextStyle(
    fontFamily: appFont,
    fontWeight: FontWeight.bold,
    fontSize: 14,
    color: ColorsApp.red,
  );

  static const body = TextStyle(
    fontFamily: appFont,
    fontWeight: FontWeight.normal,
    fontSize: 12,
    color: Colors.black,
  );
}
