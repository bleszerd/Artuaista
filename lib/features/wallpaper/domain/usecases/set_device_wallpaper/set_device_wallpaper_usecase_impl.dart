import 'package:artuaista/features/wallpaper/data/dtos/set_device_wallpaper_dto.dart';
import 'package:artuaista/features/wallpaper/domain/usecases/set_device_wallpaper/set_device_wallpaper_usecase.dart';
import 'package:flutter/services.dart';
import 'package:artuaista/core/utils/extension_utils/enum_to_string_extensions.dart';

class SetDeviceWallpaperUsecaseImpl implements SetDeviceWallpaperUsecase {
  final MethodChannel _channel =
      const MethodChannel("com.example.artuaista/wallpaper");

  @override
  Future<bool> call(SetDeviceWallpaperDto data) async {
    bool success = false;

    try {
      success = await _channel.invokeMethod(
        'WallpaperAndroidBridge@setWallpaper',
        {
          "wallpaperBytes": data.wallpaperBytes,
          "wallpaperFlag": data.wallpaperFlag.asString(),
        },
      );
    } on PlatformException catch (_) {
      // Throw Error Here!
      success = false;
    }

    return success;
  }
}
