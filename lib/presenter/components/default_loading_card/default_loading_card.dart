import 'package:flutter/material.dart';
import 'package:tdr_core/tdr_core.dart';

import '../default_loading/default_loading.dart';

class DefaultLoadingCard extends StatelessWidget {
  final String label;
  const DefaultLoadingCard({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: Column(
              children: [
                Text(
                  this.label,
                  style: TextStyleApp.body,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                const DefaultLoading(
                  color: ColorsApp.red,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
