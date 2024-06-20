import 'package:flutter/material.dart';

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
        label: Text(label),
        icon: Icon(icon),
        onPressed: this.isLoading ? null : this.onPressed,
      ),
    );
  }
}
