import 'package:artuaista/models/discover_wallpaper/discover_photo.dart';
import 'package:artuaista/repositories/wallpaper/wallpaper_respository.dart';
import 'package:flutter/cupertino.dart';

class WallpaperListController {
  final WallpaperRepository wallpaperRepository;

  ValueNotifier<List<DiscoverPhoto>> discoverPhotos =
      ValueNotifier<List<DiscoverPhoto>>([]);
  ValueNotifier<bool> loadingDiscoverPhotos = ValueNotifier<bool>(false);

  WallpaperListController({required this.wallpaperRepository});

  void getWallpapers() async {
    if (loadingDiscoverPhotos.value) return;

    loadingDiscoverPhotos.value = true;

    var response = await wallpaperRepository.getDiscoverWallpaper();
    discoverPhotos.value = response.photos as List<DiscoverPhoto>;

    loadingDiscoverPhotos.value = false;
  }
}