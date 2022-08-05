import 'package:artuaista/models/discover_wallpaper/responses/discover_wallpaper_response.dart';

abstract class WallpaperRepository {
  Future<DiscoverWallpaperResponse> getDiscoverWallpaper();
}
