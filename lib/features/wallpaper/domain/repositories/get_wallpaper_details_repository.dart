import 'package:artuaista/features/wallpaper/data/dtos/get_wallpaper_details_dto.dart';
import 'package:artuaista/features/wallpaper/domain/entities/wallpaper_details_entity.dart';

abstract class GetWallpaperDetailsRepository {
  Future<WallpaperDetailsEntity> call(
    GetWallpaperDetailsDto getWallpaperDetailsRequest,
  );
}
