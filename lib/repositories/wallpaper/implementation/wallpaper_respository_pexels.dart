import 'dart:convert';

import 'package:artuaista/models/discover_wallpaper/requests/get_discover_wallpaper.dart';
import 'package:artuaista/models/discover_wallpaper/responses/discover_wallpaper_response.dart';
import 'package:artuaista/repositories/wallpaper/wallpaper_respository.dart';
import 'package:artuaista/shared/config/dotenv.dart';
import 'package:artuaista/shared/endpoints/base_url.dart';
import 'package:artuaista/shared/endpoints/endpoints.dart';
import 'package:artuaista/shared/endpoints/utils.dart';

import 'package:http/http.dart' as http;

class WallpaperRepositoryPexels implements WallpaperRepository {
  final http.Client _client;

  WallpaperRepositoryPexels(this._client);

  @override
  Future<DiscoverWallpaperResponse> getDiscoverWallpaper(
    GetDiscoverWallpaperDTO getDiscoverWallpaperDTO,
  ) async {
    var queryParams = {
      "query": getDiscoverWallpaperDTO.keyword,
      "orientation": getDiscoverWallpaperDTO.wallpaperOrientation,
      "page": getDiscoverWallpaperDTO.page,
      "per_page": 80,
    };

    if (getDiscoverWallpaperDTO.locale != null) {
      queryParams["locale"] = getDiscoverWallpaperDTO.locale;
    }

    Uri requestUrl = EndpointUtils.createEndpointUrl(
      baseUrl: BaseUrl.pexels,
      url: Endpoints.discoverWallpaper,
      queryParams: queryParams,
    );

    var response = await _client.get(
      requestUrl,
      headers: {
        "Authorization": Dotenv.pexelsApiKey,
      },
    );
    var decodedResponse = jsonDecode(response.body);

    var discoverWallpaperResponse =
        DiscoverWallpaperResponse.fromJson(decodedResponse);

    return discoverWallpaperResponse;
  }
}
