import 'package:artuaista/features/wallpaper/data/dtos/set_device_wallpaper_dto.dart';

abstract class WallpaperService {
  Future<bool> set(SetDeviceWallpaperDto data);
}
