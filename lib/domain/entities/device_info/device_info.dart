import 'package:equatable/equatable.dart';

class DeviceInfo extends Equatable {
  final String deviceId;
  final String model;

  const DeviceInfo({
    required this.deviceId,
    required this.model,
  });

  factory DeviceInfo.empty() {
    return const DeviceInfo(
      deviceId: '',
      model: '',
    );
  }

  @override
  List<Object> get props => [deviceId, model];
}
