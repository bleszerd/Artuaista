import 'dart:typed_data';

abstract class GetWallpaperBytesDatasource {
  Future<Uint8List> call(String url);
}
