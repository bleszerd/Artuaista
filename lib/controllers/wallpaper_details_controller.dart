import 'package:artuaista/models/wallpaper/photo_details.dart';
import 'package:artuaista/models/wallpaper/requests/get_wallpaper_details.dart';
import 'package:artuaista/repositories/wallpaper/wallpaper_respository.dart';
import 'package:artuaista/shared/bridge/android/feature_wallpaper/wallpaper_android_bridge.dart';
import 'package:flutter/foundation.dart';

class WallpaperDetailsController {
  final WallpaperRepository wallpaperRepository;
  final WallpaperAndroidBridge wallpaperBridge;

  final ValueNotifier<PhotoDetails?> photoDetails =
      ValueNotifier<PhotoDetails?>(null);
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  WallpaperDetailsController({
    required this.wallpaperRepository,
    required this.wallpaperBridge,
  });

  void getWallpaparDetails(int? wallpaperId) async {
    if (wallpaperId == null || isLoading.value) return;

    isLoading.value = true;

    var response = await wallpaperRepository.getWallpaperDetails(
      GetWallpaperDetailsRequest(wallpaperId),
    );

    var responseWallpaperDetails = response;

    photoDetails.value = responseWallpaperDetails;

    isLoading.value = false;
  }

  void setWallpaper() async {
    String wallpaperUrl = photoDetails.value!.src!.original!;

    var wallpaperBytes =
        await wallpaperRepository.getWallpaperImage(wallpaperUrl);

    bool result = await wallpaperBridge.setWallpaper(wallpaperBytes);

    print(result);
  }
}
