import 'package:artuaista/core/domain/services/wallpaper_service.dart';
import 'package:artuaista/features/wallpaper/data/dtos/set_device_wallpaper_dto.dart';
import 'package:artuaista/features/wallpaper/domain/usecases/set_device_wallpaper/set_device_wallpaper_usecase.dart';

class SetDeviceWallpaperUsecaseImpl implements SetDeviceWallpaperUsecase {
  final WallpaperService _wallpaperService;

  SetDeviceWallpaperUsecaseImpl(this._wallpaperService);

  @override
  Future<bool> call(SetDeviceWallpaperDto setDeviceWallpaperDto) {
    return _wallpaperService.set(setDeviceWallpaperDto);
  }
}
