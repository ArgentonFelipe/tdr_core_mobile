import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../tdr_core.dart';

class AlertDialogInfo extends StatefulWidget {
  final String title;
  final String description;
  final VoidCallback? onPressed;

  const AlertDialogInfo({
    super.key,
    required this.title,
    this.description = 'Ocorreu um erro',
    this.onPressed,
  });

  @override
  State<AlertDialogInfo> createState() => _AlertDialogInfoState();
}

class _AlertDialogInfoState extends State<AlertDialogInfo> {
  final appInfoStore = Modular.get<AppInfoStore>();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      alignment: Alignment.center,
      actionsAlignment: MainAxisAlignment.center,
      title: Center(
        child: Text(
          this.widget.title,
          textAlign: TextAlign.center,
          style: TextStyleApp.title,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            this.widget.description,
            textAlign: TextAlign.center,
            style: TextStyleApp.body,
          ),
          const SizedBox(height: 20),
          Text(
            'Versão ${appInfoStore.versionNumber}',
            textAlign: TextAlign.center,
            style: TextStyleApp.body,
          ),
        ],
      ),
      actionsPadding: const EdgeInsets.all(8),
      actions: [
        TextButton(
          onPressed: this.widget.onPressed ?? () => Navigator.of(context).pop(),
          child: const Text(
            'Continuar',
            style: TextStyleApp.button,
          ),
        ),
      ],
    );
  }
}
