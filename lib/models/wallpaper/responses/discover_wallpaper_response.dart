import 'package:artuaista/models/wallpaper/discover_photo.dart';

class DiscoverWallpaperResponse {
  int? page;
  int? perPage;
  List<DiscoverPhoto>? photos;
  int? totalResults;
  String? nextPage;

  DiscoverWallpaperResponse(
      {this.page, this.perPage, this.photos, this.totalResults, this.nextPage});

  DiscoverWallpaperResponse.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    perPage = json['per_page'];
    if (json['photos'] != null) {
      photos = <DiscoverPhoto>[];
      json['photos'].forEach((v) {
        photos!.add(DiscoverPhoto.fromJson(v));
      });
    }
    totalResults = json['total_results'];
    nextPage = json['next_page'];
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
