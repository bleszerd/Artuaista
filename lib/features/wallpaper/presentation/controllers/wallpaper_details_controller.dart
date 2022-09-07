import 'package:artuaista/features/wallpaper/data/dtos/get_wallpaper_details_dto.dart';
import 'package:artuaista/features/wallpaper/data/dtos/set_device_wallpaper_dto.dart';
import 'package:artuaista/features/wallpaper/domain/entities/wallpaper_details_entity.dart';
import 'package:artuaista/features/wallpaper/domain/usecases/get_wallpaper_bytes/get_wallpaper_bytes_usecase.dart';
import 'package:artuaista/features/wallpaper/domain/usecases/get_wallpaper_details/get_wallpaper_details_usecase.dart';
import 'package:artuaista/features/wallpaper/domain/usecases/set_device_wallpaper/set_device_wallpaper_usecase.dart';
import 'package:flutter/foundation.dart';

class WallpaperDetailsController {
  final GetWallpaperDetailsUsecase _getWallpaperDetailsUsecase;
  final GetWallpaperBytesUsecase _getWallpaperBytesUsecase;
  final SetDeviceWallpaperUsecase _setDeviceWallpaperUsecase;

  final ValueNotifier<WallpaperDetailsEntity?> photoDetails =
      ValueNotifier<WallpaperDetailsEntity?>(null);
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  WallpaperDetailsController(
    this._getWallpaperDetailsUsecase,
    this._getWallpaperBytesUsecase,
    this._setDeviceWallpaperUsecase,
  );

  void getWallpaparDetails(int? wallpaperId) async {
    if (wallpaperId == null || isLoading.value) return;

    isLoading.value = true;

    var response = await _getWallpaperDetailsUsecase(
      GetWallpaperDetailsDto(wallpaperId),
    );

    var responseWallpaperDetails = response;

    photoDetails.value = responseWallpaperDetails;

    isLoading.value = false;
  }

  void setWallpaper(
    WallpaperFlag wallpaperFlag,
  ) async {
    isLoading.value = true;

    String wallpaperUrl = photoDetails.value!.src!.original!;

    var wallpaperBytes = await _getWallpaperBytesUsecase(wallpaperUrl);

    await _setDeviceWallpaperUsecase(
      SetDeviceWallpaperDto(
        wallpaperBytes,
        wallpaperFlag: wallpaperFlag,
      ),
    );

    isLoading.value = false;
  }
}
