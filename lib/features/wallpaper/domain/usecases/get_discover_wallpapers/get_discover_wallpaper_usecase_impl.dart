import 'package:artuaista/core/constants/base_url.dart';
import 'package:artuaista/core/domain/services/http_service.dart';
import 'package:artuaista/core/utils/dotenv_utils/dotenv_utils.dart';
import 'package:artuaista/core/utils/endpoint_utils/url_utils.dart';
import 'package:artuaista/features/wallpaper/data/datasource/remote/wallpaper_endpoints.dart';
import 'package:artuaista/features/wallpaper/domain/entities/discover_wallpaper_entity.dart';
import 'package:artuaista/features/wallpaper/data/dtos/get_discover_wallpaper_dto.dart';
import 'package:artuaista/features/wallpaper/domain/usecases/get_discover_wallpapers/get_discover_wallpaper_usecase.dart';
import 'package:artuaista/core/utils/extension_utils/enum_to_string_extensions.dart';
import 'package:artuaista/features/wallpaper/data/dtos/serializables/discover_wallpapers_serializable.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class GetDiscoverWallpaperUsecaseImpl implements GetDiscoverWallpaperUsecase {
  final HttpService httpService;

  GetDiscoverWallpaperUsecaseImpl(this.httpService);

  @override
  Future<DiscoverWallpapersEntity> call(GetDiscoverWallpaperDto data) async {
    var headers = {
      "Authorization": DotenvUtils.pexelsApiKey,
    };

    var queryParams = {
      "query": data.keyword,
      "orientation": data.wallpaperOrientation!.asString(),
      "page": data.page,
      "per_page": 80,
    };

    if (data.locale != null) {
      queryParams["locale"] = data.locale;
    }

    Uri requestUrl = EndpointUtils.createEndpointUrl(
      baseUrl: BaseUrl.pexelsBaseUrl,
      url: WallpaperEndpoints.discoverWallpaper,
      queryParams: queryParams,
    );

    var jsonResponse = await httpService.get(uri: requestUrl, headers: headers);

    return DiscoverWallpapersSerializable.fromJson(jsonResponse);
  }
}
