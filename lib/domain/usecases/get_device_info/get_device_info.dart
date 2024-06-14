import 'package:result_dart/result_dart.dart';

import '../../entities/device_info/device_info.dart';
import '../../failures/core_failures.dart';
import '../../services/device_service/device_service_interface.dart';
import 'get_device_info_interface.dart';

class GetDeviceInfo implements IGetDeviceInfo {
  final IDeviceService _deviceService;

  GetDeviceInfo({
    required IDeviceService deviceService,
  }) : _deviceService = deviceService;

  @override
  Future<Result<DeviceInfo, ICoreFailure>> call() async {
    return await _deviceService.getDeviceInfo();
  }
}
