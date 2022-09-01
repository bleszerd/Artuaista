import 'dart:typed_data';

import 'package:artuaista/shared/bridge/android/android_bridge.dart';
import 'package:artuaista/shared/bridge/android/feature_wallpaper/constants.dart';
import 'package:artuaista/shared/utils/extensions/enum_to_string_extensions.dart';
import 'package:flutter/services.dart';

class WallpaperAndroidBridge extends AndroidBridge {
  @override
  MethodChannel channel =
      const MethodChannel("com.example.artuaista/wallpaper");

  Future<bool> setWallpaper({
    required Uint8List wallpaperBytes,
    WallpaperFlag wallpaperFlag = WallpaperFlag.ALL,
  }) async {
    bool success;

    try {
      success = await channel.invokeMethod(
        'WallpaperAndroidBridge@setWallpaper',
        {
          "wallpaperBytes": wallpaperBytes,
          "wallpaperFlag": wallpaperFlag.asString(),
        },
      );
    } on PlatformException catch (_) {
      success = false;
    }

    return success;
  }
}
