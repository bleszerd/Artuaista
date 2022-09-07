import 'package:artuaista/features/wallpaper/domain/entities/discover_wallpaper_entity.dart';
import 'package:artuaista/features/wallpaper/data/dtos/serializables/wallpaper_details_serializable.dart';
import 'package:artuaista/features/wallpaper/domain/entities/wallpaper_details_entity.dart';

extension DiscoverWallpapersSerializable on DiscoverWallpapersEntity {
  static DiscoverWallpapersEntity fromJson(Map<String, dynamic> json) {
    List<WallpaperDetailsEntity> photos = [];

    for (var photo in (json['photos'] as List)) {
      photos.add(
        WallpaperDetailsSerializable.fromJson(photo),
      );
    }

    return DiscoverWallpapersEntity(
      page: json['page'],
      perPage: json['per_page'],
      photos: photos,
      totalResults: json['total_results'],
      nextPage: json['next_page'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    data['per_page'] = perPage;
    if (photos != null) {
      data['photos'] = photos!.map((v) => v.toJson()).toList();
    }
    data['total_results'] = totalResults;
    data['next_page'] = nextPage;
    return data;
  }
}
