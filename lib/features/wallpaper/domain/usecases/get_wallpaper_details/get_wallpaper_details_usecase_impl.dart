import 'package:artuaista/core/constants/base_url.dart';
import 'package:artuaista/core/domain/services/http_service.dart';
import 'package:artuaista/core/utils/dotenv_utils/dotenv_utils.dart';
import 'package:artuaista/core/utils/endpoint_utils/url_utils.dart';
import 'package:artuaista/features/wallpaper/data/datasource/remote/wallpaper_endpoints.dart';
import 'package:artuaista/features/wallpaper/data/dtos/serializables/wallpaper_details_serializable.dart';
import 'package:artuaista/features/wallpaper/domain/entities/wallpaper_details_entity.dart';
import 'package:artuaista/features/wallpaper/data/dtos/get_wallpaper_details_dto.dart';
import 'package:artuaista/features/wallpaper/domain/usecases/get_wallpaper_details/get_wallpaper_details_usecase.dart';

class GetWallpaperDetailsUsecaseImpl implements GetWallpaperDetailsUsecase {
  final HttpService _httpClient;

  GetWallpaperDetailsUsecaseImpl(this._httpClient);

  @override
  Future<WallpaperDetailsEntity> call(GetWallpaperDetailsDto data) async {
    var headers = {
      "Authorization": DotenvUtils.pexelsApiKey,
    };

    Uri requestUrl = EndpointUtils.createEndpointUrl(
      baseUrl: BaseUrl.pexelsBaseUrl,
      url: WallpaperEndpoints.getWallpaper,
      urlParams: [
        data.wallpaperId.toString(),
      ],
    );

    var jsonResponse = await _httpClient.get(uri: requestUrl, headers: headers);

    return WallpaperDetailsSerializable.fromJson(jsonResponse);
  }
}
