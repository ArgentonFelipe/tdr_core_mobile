import 'package:flutter/material.dart';

import '../../../tdr_core.dart';

class DefaultTextButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final IconData icon;

  const DefaultTextButton({
    super.key,
    required this.onPressed,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: this.onPressed,
      icon: Icon(
        this.icon,
        color: Colors.white,
      ),
      label: Text(
        this.label,
        style: TextStyleApp.button.copyWith(color: Colors.white),
      ),
    );
  }
}
