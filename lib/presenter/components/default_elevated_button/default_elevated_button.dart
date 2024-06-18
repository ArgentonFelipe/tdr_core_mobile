import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../tdr_core.dart';

class DefaultElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final bool isLoading;
  final Color? backgroundColor;
  final Color? textColor;
  final IconData? icon;
  final double? height;
  final double? elevation;

  const DefaultElevatedButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.backgroundColor,
    this.textColor,
    this.isLoading = false,
    this.icon,
    this.height,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: this.height,
      width: MediaQuery.sizeOf(context).width,
      child: Visibility(
        visible: this.icon == null,
        replacement: SizedBox(
          child: ElevatedButton.icon(
            onPressed: this.isLoading ? null : this.onPressed,
            icon: this.isLoading
                ? const SizedBox.shrink()
                : Icon(
                    this.icon,
                    color: this.textColor ?? Colors.white,
                  ),
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(
                this.backgroundColor ?? ColorsApp.red,
              ),
              elevation: WidgetStatePropertyAll(this.elevation ?? 0),
            ),
            label: Visibility(
              visible: this.isLoading,
              replacement: Text(
                this.label,
                style: TextStyleApp.button.copyWith(
                  color: this.textColor ?? Colors.white,
                ),
              ),
              child: Center(
                child: LoadingAnimationWidget.threeArchedCircle(
                  size: 40,
                  color: this.textColor ?? Colors.white,
                ),
              ),
            ),
          ),
        ),
        child: ElevatedButton(
          onPressed: this.isLoading ? null : this.onPressed,
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(
              this.backgroundColor ?? ColorsApp.red,
            ),
            elevation: WidgetStatePropertyAll(this.elevation ?? 0),
          ),
          child: Visibility(
            visible: this.isLoading,
            replacement: Text(
              this.label,
              style: TextStyleApp.button.copyWith(
                color: this.textColor ?? Colors.white,
              ),
            ),
            child: Center(
              child: LoadingAnimationWidget.threeArchedCircle(
                size: 40,
                color: this.textColor ?? Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
