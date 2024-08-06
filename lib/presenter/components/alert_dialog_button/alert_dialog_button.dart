import 'package:flutter/material.dart';

import '../../../tdr_core.dart';

class AlertDialogButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  const AlertDialogButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: this.onPressed,
      child: Text(
        this.label,
        style: TextStyleApp.button,
      ),
    );
  }
}
