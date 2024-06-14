import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'domain/services/app_service/app_service_interface.dart';
import 'domain/services/connectivity_service/connectivity_service_interface.dart';
import 'domain/services/device_service/device_service_interface.dart';
import 'domain/usecases/get_app_info/get_app_info.dart';
import 'domain/usecases/get_app_info/get_app_info_interface.dart';
import 'domain/usecases/get_device_info/get_device_info.dart';
import 'domain/usecases/get_device_info/get_device_info_interface.dart';
import 'external/helpers/package_info_wrapper/package_info_wrapper.dart';
import 'external/helpers/package_info_wrapper/package_info_wrapper_interface.dart';
import 'external/helpers/platform_wrapper/platform_wrapper.dart';
import 'external/helpers/platform_wrapper/platform_wrapper_interface.dart';
import 'external/services/app_service/app_service.dart';
import 'external/services/connectivity_service/connectivity_service.dart';
import 'external/services/device_service/device_service.dart';
import 'presenter/stores/app_info_store/app_info_store.dart';
import 'presenter/stores/device_info_store/device_info_store.dart';

class CoreModule extends Module {
  @override
  void exportedBinds(Injector i) {
    //? PLUGINS
    i.addLazySingleton<Connectivity>(Connectivity.new);
    i.addLazySingleton<DeviceInfoPlugin>(DeviceInfoPlugin.new);

    //? HELPERS
    i.addLazySingleton<IPlatformWrapper>(PlatformWrapper.new);
    i.addLazySingleton<IPackageInfoWrapper>(PackageInfoWrapper.new);

    //? SERVICES
    i.addLazySingleton<IConnectivityService>(ConnectivityService.new);
    i.addLazySingleton<IDeviceService>(DeviceService.new);
    i.addSingleton<IAppService>(AppService.new);

    //? USECASES
    i.addLazySingleton<IGetDeviceInfo>(GetDeviceInfo.new);
    i.addLazySingleton<IGetAppInfo>(GetAppInfo.new);

    //? STORES
    i.addLazySingleton<AppInfoStore>(AppInfoStore.new);
    i.addLazySingleton<DeviceInfoStore>(DeviceInfoStore.new);
  }
}
