import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../presenter/components/alert_dialog_info/alert_dialog_info.dart';

final class Messages {
  static void showError({
    required String message,
    required BuildContext context,
  }) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.error(message: message),
    );
  }

  static void showInfo({
    required String message,
    required BuildContext context,
  }) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.info(message: message),
    );
  }

  static void showSuccess({
    required String message,
    required BuildContext context,
  }) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.success(message: message),
    );
  }

  static void showAlertError({
    required String message,
    required BuildContext context,
  }) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialogInfo(
          title: 'Informação',
          description: message,
        );
      },
    );
  }
}

mixin MessageStateMixin {
  //? SNACKBAR
  final Signal<String?> _errorMessage = signal(null);
  String? get errorMessage => _errorMessage();

  final Signal<String?> _infoMessage = signal(null);
  String? get infoMessage => _infoMessage();

  final Signal<String?> _successMessage = signal(null);
  String? get successMessage => _successMessage();

  final Signal<String?> _errorAlertMessage = signal(null);
  String? get errorAlertMessage => _errorAlertMessage();

  void clearError() => _errorMessage.value = null;
  void clearInfo() => _infoMessage.value = null;
  void clearSuccess() => _successMessage.value = null;

  void clearAlertError() => _errorAlertMessage.value = null;

  void showError(String message) {
    untracked(() => clearError());
    _errorMessage.value = message;
  }

  void showInfo(String message) {
    untracked(() => clearInfo());
    _infoMessage.value = message;
  }

  void showSuccess(String message) {
    untracked(() => clearSuccess());
    _successMessage.value = message;
  }

  void showAlertError(String message) {
    untracked(() => clearAlertError());
    _errorAlertMessage.value = message;
  }

  void clearAllMessages() {
    untracked(() {
      clearError();
      clearInfo();
      clearSuccess();
      clearAlertError();
    });
  }
}

mixin MessageViewMixin<T extends StatefulWidget> on State<T> {
  void messageListener(MessageStateMixin state) {
    effect(() {
      switch (state) {
        case MessageStateMixin(:final errorMessage?):
          Messages.showError(message: errorMessage, context: context);
        case MessageStateMixin(:final infoMessage?):
          Messages.showInfo(message: infoMessage, context: context);
        case MessageStateMixin(:final successMessage?):
          Messages.showSuccess(message: successMessage, context: context);
        case MessageStateMixin(:final errorAlertMessage?):
          Messages.showAlertError(message: errorAlertMessage, context: context);
      }
    });
  }
}
