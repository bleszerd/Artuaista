import 'package:artuaista/features/wallpaper/data/dtos/get_discover_wallpaper_dto.dart';
import 'package:artuaista/features/wallpaper/domain/entities/discover_wallpaper_entity.dart';
import 'package:artuaista/features/wallpaper/domain/repositories/get_discover_wallpaper_repository.dart';
import 'package:artuaista/features/wallpaper/domain/usecases/get_discover_wallpapers/get_discover_wallpaper_usecase.dart';

class GetDiscoverWallpaperUsecaseImpl implements GetDiscoverWallpaperUsecase {
  final GetDiscoverWallpaperRepository _getDiscoverWallpaperRepository;

  GetDiscoverWallpaperUsecaseImpl(this._getDiscoverWallpaperRepository);

  @override
  Future<DiscoverWallpapersEntity> call(
      GetDiscoverWallpaperDto getDiscoverWallpaperDto) async {
    return await _getDiscoverWallpaperRepository(getDiscoverWallpaperDto);
  }
}
