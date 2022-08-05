import 'dart:convert';

import 'package:artuaista/models/discover_wallpaper/responses/discover_wallpaper_response.dart';
import 'package:artuaista/repositories/wallpaper/wallpaper_respository.dart';
import 'package:artuaista/shared/endpoints/base_url.dart';
import 'package:artuaista/shared/endpoints/endpoints.dart';
import 'package:artuaista/shared/endpoints/utils.dart';

import 'package:http/http.dart' as http;

class WallpaperRepositoryPexels implements WallpaperRepository {
  final http.Client _client;

  WallpaperRepositoryPexels(this._client);

  @override
  Future<DiscoverWallpaperResponse> getDiscoverWallpaper() async {
    Uri requestUrl = EndpointUtils.createEndpointUrl(
      baseUrl: BaseUrl.pexels,
      url: Endpoints.discoverWallpaper,
      queryParams: {
        "query": "nature",
        "orientation": "portrait",
        // "locale": "pt-BR",
        "page": 1,
        "per_page": 35,
      },
    );

    var response = await _client.get(requestUrl);
    var decodedResponse = jsonDecode(response.body);

    var discoverWallpaperResponse =
        DiscoverWallpaperResponse.fromJson(decodedResponse);

    return discoverWallpaperResponse;
  }
}
