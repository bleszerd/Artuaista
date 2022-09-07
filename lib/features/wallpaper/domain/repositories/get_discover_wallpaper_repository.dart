import 'package:artuaista/features/wallpaper/data/dtos/get_discover_wallpaper_dto.dart';
import 'package:artuaista/features/wallpaper/domain/entities/discover_wallpaper_entity.dart';

abstract class GetDiscoverWallpaperRepository {
  Future<DiscoverWallpapersEntity> call(
    GetDiscoverWallpaperDto getDiscoverWallpaperRequest,
  );
}
