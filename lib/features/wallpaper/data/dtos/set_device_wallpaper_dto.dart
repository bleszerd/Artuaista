import 'dart:typed_data';

enum WallpaperFlag {
  system,
  lock,
  all,
}

class SetDeviceWallpaperDto {
  final Uint8List wallpaperBytes;
  final WallpaperFlag wallpaperFlag;

  SetDeviceWallpaperDto(
    this.wallpaperBytes, {
    this.wallpaperFlag = WallpaperFlag.all,
  });
}
