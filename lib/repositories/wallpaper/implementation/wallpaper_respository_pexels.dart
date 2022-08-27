import 'dart:convert';
import 'dart:ffi';
import 'dart:typed_data';

import 'package:artuaista/models/errors/generic_app_error.dart';
import 'package:artuaista/models/wallpaper/photo_details.dart';
import 'package:artuaista/models/wallpaper/requests/get_discover_wallpaper.dart';
import 'package:artuaista/models/wallpaper/requests/get_wallpaper_details.dart';
import 'package:artuaista/models/wallpaper/responses/discover_wallpaper_response.dart';
import 'package:artuaista/repositories/wallpaper/wallpaper_respository.dart';
import 'package:artuaista/shared/config/dotenv.dart';
import 'package:artuaista/shared/endpoints/base_url.dart';
import 'package:artuaista/shared/endpoints/endpoints.dart';
import 'package:artuaista/shared/endpoints/utils.dart';
import 'package:artuaista/shared/utils/extensions/enum_to_string_extensions.dart';

import 'package:http/http.dart' as http;

class WallpaperRepositoryPexels implements WallpaperRepository {
  final http.Client _client;

  WallpaperRepositoryPexels(this._client);

  @override
  Future<DiscoverWallpaperResponse> getDiscoverWallpaper(
    GetDiscoverWallpaperRequest getDiscoverWallpaperDTO,
  ) async {
    var queryParams = {
      "query": getDiscoverWallpaperDTO.keyword,
      "orientation": getDiscoverWallpaperDTO.wallpaperOrientation!.asString(),
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

  @override
  Future<PhotoDetails> getWallpaperDetails(
    GetWallpaperDetailsRequest getWallpaperDetailsRequest,
  ) async {
    Uri requestUrl = EndpointUtils.createEndpointUrl(
      baseUrl: BaseUrl.pexels,
      url: Endpoints.getWallpaperDetails,
      urlParams: [
        getWallpaperDetailsRequest.wallpaperId.toString(),
      ],
    );

    var response = await _client.get(
      requestUrl,
      headers: {
        "Authorization": Dotenv.pexelsApiKey,
      },
    );

    var decodedResponse = jsonDecode(response.body);

    var getWallpaperDetailsResponse = PhotoDetails.fromJson(decodedResponse);

    return getWallpaperDetailsResponse;
  }

  @override
  Future<Uint8List> getWallpaperImage(String url) async {
    var response = await _client.get(
      Uri.parse(url),
    );

    return response.bodyBytes;
  }
}
