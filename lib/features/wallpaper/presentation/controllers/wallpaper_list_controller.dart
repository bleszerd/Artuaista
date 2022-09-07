import 'package:artuaista/features/wallpaper/data/dtos/get_discover_wallpaper_dto.dart';
import 'package:artuaista/features/wallpaper/domain/entities/wallpaper_details_entity.dart';
import 'package:artuaista/features/wallpaper/domain/usecases/get_discover_wallpapers/get_discover_wallpaper_usecase.dart';
import 'package:flutter/cupertino.dart';

class WallpaperListController {
  final GetDiscoverWallpaperUsecase _getDiscoverWallpaperUsecase;

  ValueNotifier<List<WallpaperDetailsEntity>> discoverPhotos =
      ValueNotifier<List<WallpaperDetailsEntity>>([]);
  ValueNotifier<bool> loadingDiscoverPhotos = ValueNotifier<bool>(false);
  ValueNotifier<String> searchKeyword = ValueNotifier<String>("animal");
  int currentPage = 1;

  WallpaperListController(this._getDiscoverWallpaperUsecase);

  void getWallpapers({required int page, bool refreshing = false}) async {
    if (loadingDiscoverPhotos.value) return;

    loadingDiscoverPhotos.value = true;

    var response = await _getDiscoverWallpaperUsecase(
      GetDiscoverWallpaperDto(
        page: page,
        keyword: searchKeyword.value,
        wallpaperOrientation: WallpaperOrientation.portrait,
      ),
    );

    var responsePhotos = response.photos as List<WallpaperDetailsEntity>;

    if (refreshing) {
      discoverPhotos.value = responsePhotos;
    } else {
      currentPage += 1;
      discoverPhotos.value.addAll(responsePhotos);
    }

    loadingDiscoverPhotos.value = false;
  }
}
