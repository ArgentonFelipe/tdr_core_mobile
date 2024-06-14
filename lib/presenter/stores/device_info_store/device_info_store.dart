import '../../../../domain/entities/device_info/device_info.dart';

class DeviceInfoStore {
  DeviceInfo _deviceInfo = DeviceInfo.empty();

  void setDeviceInfo(DeviceInfo deviceInfo) => _deviceInfo = deviceInfo;

  String get deviceId => _deviceInfo.deviceId;
}
