import 'dart:typed_data';

abstract class GetWallpaperBytesUsecase {
  Future<Uint8List> call(String url);
}
