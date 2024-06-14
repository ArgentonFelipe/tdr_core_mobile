import 'package:flutter/material.dart';

final class TextStyleApp {
  static const appFont = 'Montserrat';

  static const title = TextStyle(
    fontFamily: appFont,
    fontWeight: FontWeight.bold,
    fontSize: 16,
    color: Colors.black,
  );
  static const subtitle = TextStyle(
    fontFamily: appFont,
    fontWeight: FontWeight.bold,
    fontSize: 14,
    color: Colors.black,
  );

  static const button = TextStyle(
    fontFamily: appFont,
    fontWeight: FontWeight.bold,
    fontSize: 14,
    color: Colors.white,
  );

  static const body = TextStyle(
    fontFamily: appFont,
    fontWeight: FontWeight.normal,
    fontSize: 12,
    color: Colors.black,
  );
}
