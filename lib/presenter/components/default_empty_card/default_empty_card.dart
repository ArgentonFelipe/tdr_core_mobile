import 'package:flutter/material.dart';
import 'package:tdr_core/tdr_core.dart';

class DefaultEmptyCard extends StatelessWidget {
  final String label;
  const DefaultEmptyCard({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: Text(
              this.label,
              style: TextStyleApp.body,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
