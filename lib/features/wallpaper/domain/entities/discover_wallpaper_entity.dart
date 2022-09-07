import 'package:artuaista/features/wallpaper/domain/entities/wallpaper_details_entity.dart';

class DiscoverWallpapersEntity {
  int? page;
  int? perPage;
  List<WallpaperDetailsEntity>? photos;
  int? totalResults;
  String? nextPage;

  DiscoverWallpapersEntity({
    this.page,
    this.perPage,
    this.photos,
    this.totalResults,
    this.nextPage,
  });
}
