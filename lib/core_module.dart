import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'domain/repositories/apk_repository/apk_repository_interface.dart';
import 'domain/repositories/configuration_rest_repository/configuration_rest_repository_interface.dart';
import 'domain/repositories/geolocator_rest_repository/geolocator_rest_repository_interface.dart';
import 'domain/repositories/version_repository/version_repository_interface.dart';
import 'domain/services/app_service/app_service_interface.dart';
import 'domain/services/connectivity_service/connectivity_service_interface.dart';
import 'domain/services/device_service/device_service_interface.dart';
import 'domain/services/file_service/file_service_interface.dart';
import 'domain/services/geolocator_service_interface.dart';
import 'domain/services/vibration_service/vibration_service_interface.dart';
import 'domain/usecases/check_project_latest_version/check_project_latest_version.dart';
import 'domain/usecases/check_project_latest_version/check_project_latest_version_interface.dart';
import 'domain/usecases/get_app_info/get_app_info.dart';
import 'domain/usecases/get_app_info/get_app_info_interface.dart';
import 'domain/usecases/get_current_position/get_current_position.dart';
import 'domain/usecases/get_current_position/get_current_position_interface.dart';
import 'domain/usecases/get_device_info/get_device_info.dart';
import 'domain/usecases/get_device_info/get_device_info_interface.dart';
import 'domain/usecases/get_listen_position/get_listen_position.dart';
import 'domain/usecases/get_listen_position/get_listen_position_interfafce.dart';
import 'domain/usecases/initialize_geolocator/initialize_geolocator.dart';
import 'domain/usecases/initialize_geolocator/initialize_geolocator_interface.dart';
import 'domain/usecases/set_base_url/set_base_url.dart';
import 'domain/usecases/set_base_url/set_base_url_interface.dart';
import 'domain/usecases/update_app/update_app.dart';
import 'domain/usecases/update_app/update_app_interface.dart';
import 'domain/usecases/vibrate_phone/vibrate_phone.dart';
import 'domain/usecases/vibrate_phone/vibrate_phone_interface.dart';
import 'external/helpers/package_info_wrapper/package_info_wrapper.dart';
import 'external/helpers/package_info_wrapper/package_info_wrapper_interface.dart';
import 'external/helpers/platform_wrapper/platform_wrapper.dart';
import 'external/helpers/platform_wrapper/platform_wrapper_interface.dart';
import 'external/helpers/rest_client/dio_rest_client/rest_client_dio.dart';
import 'external/helpers/rest_client/interfaces/rest_client_interface.dart';
import 'external/repositories/apk_repository/apk_repository.dart';
import 'external/repositories/configuration_rest_repository/configuration_rest_repository.dart';
import 'external/repositories/geolocator_rest_repository/geolocator_rest_repository.dart';
import 'external/repositories/version_repository/version_repository.dart';
import 'external/services/app_service/app_service.dart';
import 'external/services/connectivity_service/connectivity_service.dart';
import 'external/services/device_service/device_service.dart';
import 'external/services/file_service/file_service.dart';
import 'external/services/geolocator_service/geolocator_service.dart';
import 'external/services/vibration_service/vibration_service.dart';
import 'presenter/stores/app_info_store/app_info_store.dart';
import 'presenter/stores/device_info_store/device_info_store.dart';

class CoreModule extends Module {
  @override
  void exportedBinds(Injector i) {
    //? PLUGINS
    i.addLazySingleton<Connectivity>(Connectivity.new);
    i.addLazySingleton<DeviceInfoPlugin>(DeviceInfoPlugin.new);
    i.addLazySingleton<FlutterSecureStorage>(FlutterSecureStorage.new);

    //? HELPERS
    i.addLazySingleton<IPlatformWrapper>(PlatformWrapper.new);
    i.addLazySingleton<IPackageInfoWrapper>(PackageInfoWrapper.new);
    i.addInstance<IRestClient>(RestClientDio.instance);

    //? SERVICES
    i.addLazySingleton<IConnectivityService>(ConnectivityService.new);
    i.addLazySingleton<IDeviceService>(DeviceService.new);
    i.addSingleton<IAppService>(AppService.new);
    i.addLazySingleton<IGeolocatorService>(GeolocatorService.new);
    i.addLazySingleton<IFileService>(FileService.new);
    i.addLazySingleton<IVibrationService>(VibrationService.new);

    //? REPOSITORIES
    i.addLazySingleton<IGeolocatorRestRepository>(GeolocatorRestRepository.new);
    i.addLazySingleton<IConfigurationRestRepository>(
      ConfigurationRestRepository.new,
    );
    i.addLazySingleton<IApkRepository>(ApkRepository.new);
    i.addLazySingleton<IVersionRepository>(VersionRepository.new);

    //? USECASES
    i.addLazySingleton<IGetDeviceInfo>(GetDeviceInfo.new);
    i.addLazySingleton<IGetAppInfo>(GetAppInfo.new);
    i.addLazySingleton<IGetCurrentPosition>(GetCurrentPosition.new);
    i.addLazySingleton<IInitializeGeolocator>(InitializeGeolocator.new);
    i.addLazySingleton<ISetBaseUrl>(SetBaseUrl.new);
    i.addLazySingleton<ICheckProjectLatestVersion>(
      CheckProjectLatestVersion.new,
    );
    i.addLazySingleton<IUpdateApp>(UpdateApp.new);
    i.addLazySingleton<IGetListenPosition>(GetListenPosition.new);
    i.addLazySingleton<IVibratePhone>(VibratePhone.new);

    //? STORES
    i.addLazySingleton<AppInfoStore>(AppInfoStore.new);
    i.addLazySingleton<DeviceInfoStore>(DeviceInfoStore.new);
  }
}
