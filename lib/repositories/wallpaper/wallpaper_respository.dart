import 'dart:typed_data';

import 'package:artuaista/models/wallpaper/photo_details.dart';
import 'package:artuaista/models/wallpaper/requests/get_discover_wallpaper.dart';
import 'package:artuaista/models/wallpaper/requests/get_wallpaper_details.dart';
import 'package:artuaista/models/wallpaper/responses/discover_wallpaper_response.dart';

abstract class WallpaperRepository {
  Future<DiscoverWallpaperResponse> getDiscoverWallpaper(
    GetDiscoverWallpaperRequest getDiscoverWallpaperRequest,
  );

  Future<PhotoDetails> getWallpaperDetails(
    GetWallpaperDetailsRequest getWallpaperDetailsRequest,
  );

  Future<Uint8List> getWallpaperImage(String url);
}
