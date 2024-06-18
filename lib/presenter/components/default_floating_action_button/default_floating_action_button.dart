import 'package:flutter/material.dart';

import '../../../tdr_core.dart';

class DefaultFloatingActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onPressed;
  final bool isVisible;
  final bool isLoading;

  const DefaultFloatingActionButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon = Icons.add_circle,
    this.isVisible = true,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: this.isVisible,
      child: FloatingActionButton.extended(
        backgroundColor: Colors.white,
        label: Text(label, style: TextStyleApp.button),
        extendedTextStyle: TextStyleApp.title,
        icon: Icon(
          icon,
          color: ColorsApp.red,
        ),
        onPressed: this.isLoading ? null : this.onPressed,
      ),
    );
  }
}
