class GetDiscoverWallpaperDTO {
  final String? keyword;
  final WallpaperOrientation? wallpaperOrientation;
  final String? locale;
  final int page;

  GetDiscoverWallpaperDTO({
    this.wallpaperOrientation,
    this.locale,
    required this.keyword,
    required this.page,
  });
}

enum WallpaperOrientation {
  portrait,
  landscape,
  square,
}
