import 'package:artuaista/core/constants/application.dart';
import 'package:artuaista/core/domain/services/wallpaper_service.dart';
import 'package:artuaista/features/error/domain/entities/app_error.dart';
import 'package:artuaista/features/error/domain/usecases/throw_expected_app_error/throw_expected_app_error_usecase.dart';
import 'package:artuaista/features/wallpaper/data/dtos/set_device_wallpaper_dto.dart';
import 'package:flutter/services.dart';
import 'package:artuaista/core/utils/extension_utils/enum_to_string_extensions.dart';

class NativeWallpaperServiceImpl implements WallpaperService {
  final ThrowExpectedAppErrorUsecase _throwExpectedAppErrorUsecase;

  final MethodChannel _nativeChannel = const MethodChannel(
    "${ApplicationConstants.appPackage}/wallpaper",
  );

  NativeWallpaperServiceImpl(this._throwExpectedAppErrorUsecase);

  @override
  Future<bool> set(SetDeviceWallpaperDto data) async {
    bool success = true;

    try {
      success = await _nativeChannel.invokeMethod(
        'WallpaperAndroidBridge@set',
        {
          "wallpaperBytes": data.wallpaperBytes,
          "wallpaperFlag": data.wallpaperFlag.asString(),
        },
      );
    } on PlatformException catch (_) {
      _throwExpectedAppErrorUsecase(
        AppErrorCode.wallpaperCall,
        extraMessage: 'Exception during wallpaper set',
      );
    }

    return success;
  }
}
