import 'dart:typed_data';

import 'package:artuaista/features/wallpaper/data/datasource/get_wallpaper_bytes_datasouce.dart';
import 'package:artuaista/features/wallpaper/domain/repositories/get_wallpaper_bytes_repository.dart';

class GetWallpaperBytesRepositoryImpl implements GetWallpaperBytesRepository {
  final GetWallpaperBytesDatasource _getWallpaperBytesDatasource;

  GetWallpaperBytesRepositoryImpl(this._getWallpaperBytesDatasource);

  @override
  Future<Uint8List> call(String url) async {
    return await _getWallpaperBytesDatasource(url);
  }
}
