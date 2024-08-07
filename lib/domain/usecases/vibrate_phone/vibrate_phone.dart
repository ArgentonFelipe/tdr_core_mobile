import 'package:result_dart/result_dart.dart';

import '../../services/vibration_service/vibration_service_interface.dart';
import 'vibrate_phone_interface.dart';

class VibratePhone implements IVibratePhone {
  final IVibrationService _vibrationService;

  VibratePhone({
    required IVibrationService vibrationService,
  }) : _vibrationService = vibrationService;
  @override
  Unit call() {
    return _vibrationService.vibrate();
  }
}
