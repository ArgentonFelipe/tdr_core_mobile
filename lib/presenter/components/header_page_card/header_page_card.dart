import 'package:flutter/material.dart';

import '../../../utils/styles/colors_app/colors_app.dart';
import '../../../utils/styles/text_styles/text_styles.dart';

class HeaderPageCard extends Card {
  final String label;
  HeaderPageCard({
    super.key,
    super.color = ColorsApp.red,
    super.surfaceTintColor = ColorsApp.red,
    required this.label,
  }) : super(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: Text(
                label,
                style: TextStyleApp.title.copyWith(color: Colors.white),
              ),
            ),
          ),
        );
}
