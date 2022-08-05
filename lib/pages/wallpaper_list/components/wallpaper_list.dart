import 'package:artuaista/models/discover_wallpaper/discover_photo.dart';
import 'package:flutter/material.dart';

class WallpaperList extends StatelessWidget {
  final int wallpaperCount;
  final List<DiscoverPhoto> wallpapers;

  const WallpaperList({
    Key? key,
    required this.wallpaperCount,
    required this.wallpapers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cardSize = MediaQuery.of(context).size.width / 2 - 6;

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: wallpaperCount,
      itemBuilder: (context, index) {
        if (index % 2 == 0) {
          var imageUriFirst = wallpapers[index].src?.portrait;

          var imageUriSecond = index != wallpapers.length - 1
              ? wallpapers[index + 1].src?.portrait
              : null;

          return imageUriFirst != null
              ? Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(3),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: SizedBox(
                          height: 350,
                          width: cardSize,
                          child: Image.network(
                            fit: BoxFit.fitHeight,
                            imageUriFirst,
                          ),
                        ),
                      ),
                    ),
                    imageUriSecond != null
                        ? Padding(
                            padding: const EdgeInsets.all(3),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: SizedBox(
                                height: 350,
                                width: cardSize,
                                child: Image.network(
                                  fit: BoxFit.fitHeight,
                                  imageUriSecond,
                                ),
                              ),
                            ),
                          )
                        : const SizedBox.shrink()
                  ],
                )
              : const SizedBox.shrink();
        }

        return const SizedBox.shrink();
      },
    );
  }
}
