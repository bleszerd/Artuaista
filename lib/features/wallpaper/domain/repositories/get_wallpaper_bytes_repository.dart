import 'dart:typed_data';

abstract class GetWallpaperBytesRepository {
  Future<Uint8List> call(String url);
}
