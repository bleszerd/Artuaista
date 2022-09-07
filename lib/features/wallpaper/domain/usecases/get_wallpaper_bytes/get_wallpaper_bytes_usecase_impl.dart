import 'dart:typed_data';

import 'package:artuaista/core/domain/services/http_service.dart';
import 'package:artuaista/core/utils/dotenv_utils/dotenv_utils.dart';
import 'package:artuaista/core/utils/endpoint_utils/url_utils.dart';
import 'package:artuaista/features/wallpaper/domain/usecases/get_wallpaper_bytes/get_wallpaper_bytes_usecase.dart';

class GetWallpaperBytesUsecaseImpl implements GetWallpaperBytesUsecase {
  final HttpService _httpClient;

  GetWallpaperBytesUsecaseImpl(this._httpClient);

  @override
  Future<Uint8List> call(String url) async {
    var headers = {
      "Authorization": DotenvUtils.pexelsApiKey,
    };

    Uri requestUri = EndpointUtils.createEndpointUrl(url: url);

    String stringfiedWallpaperBytes = await _httpClient.get<String>(
      uri: requestUri,
      headers: headers,
      decodeResponse: false,
    );

    List<int> wallpaperIntegerBytes = stringfiedWallpaperBytes.codeUnits;
    Uint8List wallpaperBytes = Uint8List.fromList(wallpaperIntegerBytes);

    return wallpaperBytes;
  }
}
