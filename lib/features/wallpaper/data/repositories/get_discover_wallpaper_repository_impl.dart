import 'package:artuaista/features/wallpaper/data/datasource/get_discover_wallpapers_datasource.dart';
import 'package:artuaista/features/wallpaper/domain/entities/discover_wallpaper_entity.dart';
import 'package:artuaista/features/wallpaper/data/dtos/get_discover_wallpaper_dto.dart';
import 'package:artuaista/features/wallpaper/domain/repositories/get_discover_wallpaper_repository.dart';

class GetDiscoverWallpaperRepositoryImpl
    implements GetDiscoverWallpaperRepository {
  final GetDiscoverWallpapersDatasource _getDiscoverWallpapersDatasource;

  GetDiscoverWallpaperRepositoryImpl(this._getDiscoverWallpapersDatasource);

  @override
  Future<DiscoverWallpapersEntity> call(
      GetDiscoverWallpaperDto getDiscoverWallpaperDto) async {
    return await _getDiscoverWallpapersDatasource(getDiscoverWallpaperDto);
  }
}
