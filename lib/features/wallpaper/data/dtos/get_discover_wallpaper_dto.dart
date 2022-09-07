enum WallpaperOrientation {
  portrait,
  landscape,
  square,
}

class GetDiscoverWallpaperDto {
  final String? keyword;
  final WallpaperOrientation? wallpaperOrientation;
  final String? locale;
  final int page;

  GetDiscoverWallpaperDto({
    this.wallpaperOrientation,
    this.locale,
    required this.keyword,
    required this.page,
  });
}
