import 'package:artuaista/models/discover_wallpaper/discover_photo.dart';
import 'package:artuaista/models/discover_wallpaper/requests/get_discover_wallpaper.dart';
import 'package:artuaista/repositories/wallpaper/wallpaper_respository.dart';
import 'package:flutter/cupertino.dart';

class WallpaperListController {
  final WallpaperRepository wallpaperRepository;

  ValueNotifier<List<DiscoverPhoto>> discoverPhotos =
      ValueNotifier<List<DiscoverPhoto>>([]);
  ValueNotifier<bool> loadingDiscoverPhotos = ValueNotifier<bool>(false);
  ValueNotifier<String> searchKeyword = ValueNotifier<String>("animal");
  int currentPage = 1;

  WallpaperListController({required this.wallpaperRepository});

  void getWallpapers({required int page, bool refreshing = false}) async {
    if (loadingDiscoverPhotos.value) return;

    loadingDiscoverPhotos.value = true;

    var response = await wallpaperRepository.getDiscoverWallpaper(
      GetDiscoverWallpaperDTO(
        page: page,
        keyword: searchKeyword.value,
        wallpaperOrientation: WallpaperOrientation.portrait,
      ),
    );

    var responsePhotos = response.photos as List<DiscoverPhoto>;

    if (refreshing) {
      discoverPhotos.value = responsePhotos;
    } else {
      currentPage += 1;
      discoverPhotos.value.addAll(responsePhotos);
    }

    loadingDiscoverPhotos.value = false;
  }
}
