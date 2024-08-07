import 'package:result_dart/result_dart.dart';
import 'package:vibration/vibration.dart';

import '../../../domain/services/vibration_service/vibration_service_interface.dart';

class VibrationService implements IVibrationService {
  @override
  Unit vibrate() {
    Vibration.vibrate();
    return unit;
  }
}
