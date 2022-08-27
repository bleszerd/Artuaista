import 'dart:typed_data';

import 'package:artuaista/shared/bridge/android/android_bridge.dart';
import 'package:flutter/services.dart';

class WallpaperAndroidBridge extends AndroidBridge {
  @override
  MethodChannel channel =
      const MethodChannel("com.example.artuaista/wallpaper");

  Future<bool> setWallpaper(Uint8List wallpaperBytes) async {
    bool success;

    try {
      success = await channel.invokeMethod(
        'WallpaperAndroidBridge@setWallpaper',
        {
          "wallpaperBytes": wallpaperBytes,
        },
      );
    } on PlatformException catch (_) {
      success = false;
    }

    return success;
  }
}
