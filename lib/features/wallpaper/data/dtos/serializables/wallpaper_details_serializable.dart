import 'package:artuaista/features/wallpaper/domain/entities/wallpaper_details_entity.dart';

extension WallpaperDetailsSerializable on WallpaperDetailsEntity {
  static WallpaperDetailsEntity fromJson(Map<String, dynamic> json) {
    var wallpaperSrc = WallpaperSrcSerializable.fromJson(json['src']);

    return WallpaperDetailsEntity(
      id: json['id'],
      width: json['width'],
      height: json['height'],
      url: json['url'],
      photographer: json['photographer'],
      photographerUrl: json['photographer_url'],
      photographerId: json['photographer_id'],
      avgColor: json['avg_color'],
      src: wallpaperSrc,
      liked: json['liked'],
      alt: json['alt'],
    );
  }

  Map toJson() {
    return {
      'id': id,
      'width': width,
      'height': height,
      'url': url,
      'photographer': photographer,
      'photographer_url': photographerUrl,
      'photographer_id': photographerId,
      'avg_color': avgColor,
      'src': src?.toJson(),
      'likes': liked,
      'alt': alt,
    };
  }
}

extension WallpaperSrcSerializable on WallpaperSrc {
  Map toJson() {
    return {
      'original': original,
      'large2x': large2x,
      'large': large,
      'medium': medium,
      'small': small,
      'portrait': portrait,
      'landscape': landscape,
      'tiny': tiny,
    };
  }

  static WallpaperSrc fromJson(Map<String, dynamic> json) {
    return WallpaperSrc(
      original: json['original'],
      large2x: json['large2x'],
      large: json['large'],
      medium: json['medium'],
      small: json['small'],
      portrait: json['portrait'],
      landscape: json['landscape'],
      tiny: json['tiny'],
    );
  }
}
