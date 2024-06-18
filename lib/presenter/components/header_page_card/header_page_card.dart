import 'package:flutter/material.dart';
import 'package:tdr_core/tdr_core.dart';

class HeaderPageCard extends Card {
  final String label;
  HeaderPageCard({
    super.key,
    super.color = ColorsApp.red,
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
