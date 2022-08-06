import 'package:artuaista/models/discover_wallpaper/requests/get_discover_wallpaper.dart';
import 'package:artuaista/models/discover_wallpaper/responses/discover_wallpaper_response.dart';

abstract class WallpaperRepository {
  Future<DiscoverWallpaperResponse> getDiscoverWallpaper(
    GetDiscoverWallpaperDTO getDiscoverWallpaperDTO,
  );
}
