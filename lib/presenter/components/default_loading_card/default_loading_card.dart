import 'package:flutter/material.dart';

import '../../../tdr_core.dart';

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
