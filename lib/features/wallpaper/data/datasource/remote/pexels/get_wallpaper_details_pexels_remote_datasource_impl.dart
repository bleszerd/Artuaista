import 'package:artuaista/core/constants/base_url.dart';
import 'package:artuaista/core/domain/services/http_service.dart';
import 'package:artuaista/core/utils/dotenv_utils/dotenv_utils.dart';
import 'package:artuaista/core/utils/endpoint_utils/url_utils.dart';
import 'package:artuaista/features/wallpaper/data/datasource/get_wallpaper_details_datasource.dart';
import 'package:artuaista/features/wallpaper/data/datasource/remote/pexels/constants/wallpaper_endpoints.dart';
import 'package:artuaista/features/wallpaper/data/dtos/serializables/wallpaper_details_serializable.dart';
import 'package:artuaista/features/wallpaper/domain/entities/wallpaper_details_entity.dart';
import 'package:artuaista/features/wallpaper/data/dtos/get_wallpaper_details_dto.dart';

class GetWallpaperDetailsPexelsRemoteDatasouceImpl
    implements GetWallpaperDetailsDatasource {
  final HttpService _httpService;

  GetWallpaperDetailsPexelsRemoteDatasouceImpl(this._httpService);

  @override
  Future<WallpaperDetailsEntity> call(
      GetWallpaperDetailsDto getWallpaperDetailsDto) async {
    var headers = {
      "Authorization": DotenvUtils.pexelsApiKey,
    };

    Uri requestUrl = EndpointUtils.createEndpointUrl(
      baseUrl: BaseUrlConstants.pexelsBaseUrl,
      url: WallpaperEndpoints.getWallpaper,
      urlParams: [
        getWallpaperDetailsDto.wallpaperId.toString(),
      ],
    );

    var jsonResponse =
        await _httpService.get(uri: requestUrl, headers: headers);

    return WallpaperDetailsSerializable.fromJson(jsonResponse);
  }
}
