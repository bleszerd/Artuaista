import 'package:artuaista/features/wallpaper/domain/entities/wallpaper_details_entity.dart';
import 'package:artuaista/features/wallpaper/data/dtos/get_wallpaper_details_dto.dart';
import 'package:artuaista/features/wallpaper/domain/repositories/get_wallpaper_details_repository.dart';
import 'package:artuaista/features/wallpaper/domain/usecases/get_wallpaper_details/get_wallpaper_details_usecase.dart';

class GetWallpaperDetailsUsecaseImpl implements GetWallpaperDetailsUsecase {
  final GetWallpaperDetailsRepository _getWallpaperDetailsRepository;

  GetWallpaperDetailsUsecaseImpl(this._getWallpaperDetailsRepository);

  @override
  Future<WallpaperDetailsEntity> call(
      GetWallpaperDetailsDto getWallpaperDetailsDto) async {
    return await _getWallpaperDetailsRepository(getWallpaperDetailsDto);
  }
}
