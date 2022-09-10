import 'package:artuaista/features/wallpaper/data/datasource/get_wallpaper_details_datasource.dart';
import 'package:artuaista/features/wallpaper/domain/entities/wallpaper_details_entity.dart';
import 'package:artuaista/features/wallpaper/data/dtos/get_wallpaper_details_dto.dart';
import 'package:artuaista/features/wallpaper/domain/repositories/get_wallpaper_details_repository.dart';

class GetWallpaperDetailsRepositoryImpl
    implements GetWallpaperDetailsRepository {
  final GetWallpaperDetailsDatasource _getWallpaperDetailsDatasource;

  GetWallpaperDetailsRepositoryImpl(this._getWallpaperDetailsDatasource);

  @override
  Future<WallpaperDetailsEntity> call(
      GetWallpaperDetailsDto getWallpaperDetailsDto) async {
    return await _getWallpaperDetailsDatasource(getWallpaperDetailsDto);
  }
}
