import 'dart:typed_data';

import 'package:artuaista/features/wallpaper/domain/repositories/get_wallpaper_bytes_repository.dart';
import 'package:artuaista/features/wallpaper/domain/usecases/get_wallpaper_bytes/get_wallpaper_bytes_usecase.dart';

class GetWallpaperBytesUsecaseImpl implements GetWallpaperBytesUsecase {
  final GetWallpaperBytesRepository _getWallpaperBytesRepository;

  GetWallpaperBytesUsecaseImpl(this._getWallpaperBytesRepository);

  @override
  Future<Uint8List> call(String url) async {
    return _getWallpaperBytesRepository(url);
  }
}
