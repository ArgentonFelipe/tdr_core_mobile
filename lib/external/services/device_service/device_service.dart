import 'package:device_info_plus/device_info_plus.dart';
import 'package:result_dart/result_dart.dart';
import 'package:tdr_core/domain/failures/core_failures.dart';

import '../../../domain/entities/device_info/device_info.dart';
import '../../../domain/services/device_service/device_service_interface.dart';
import '../../helpers/platform_wrapper/platform_wrapper_interface.dart';

class DeviceService implements IDeviceService {
  final DeviceInfoPlugin _deviceInfoPlugin;
  final IPlatformWrapper _platformWrapper;

  DeviceService({
    required DeviceInfoPlugin deviceInfoPlugin,
    required IPlatformWrapper platformWrapper,
  })  : _deviceInfoPlugin = deviceInfoPlugin,
        _platformWrapper = platformWrapper;

  @override
  Future<Result<DeviceInfo, ICoreFailure>> getDeviceInfo() async {
    {
      late final String deviceID;
      if (_platformWrapper.isIOS()) {
        final iOSInfo = await _deviceInfoPlugin.iosInfo;
        deviceID = iOSInfo.model;
      } else if (_platformWrapper.isAndroid()) {
        final androidInfo = await _deviceInfoPlugin.androidInfo;
        deviceID = androidInfo.id;
      } else if (_platformWrapper.isWindows()) {
        final windowsInfo = await _deviceInfoPlugin.windowsInfo;
        deviceID = windowsInfo.deviceId;
      } else {
        return Failure(
          DeviceServiceFailure(
            message:
                'Não conseguimos recuperar as informações do seu dispositivo, pois a plataforma utilizada é incompativel com nosso sistema',
          ),
        );
      }

      return Success(DeviceInfo(deviceId: deviceID, model: ''));
    }
  }
}
