import 'package:artuaista/models/wallpaper/photo_details.dart';
import 'package:artuaista/models/wallpaper/requests/get_wallpaper_details.dart';
import 'package:artuaista/repositories/wallpaper/wallpaper_respository.dart';
import 'package:flutter/foundation.dart';

class WallpaperDetailsController {
  final WallpaperRepository wallpaperRepository;

  final ValueNotifier<PhotoDetails?> photoDetails =
      ValueNotifier<PhotoDetails?>(null);
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  WallpaperDetailsController({required this.wallpaperRepository});

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
}
