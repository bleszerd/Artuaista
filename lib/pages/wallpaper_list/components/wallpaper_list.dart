import 'package:artuaista/models/wallpaper/discover_photo.dart';
import 'package:flutter/material.dart';

class WallpaperList extends StatelessWidget {
  final int wallpaperCount;
  final List<DiscoverPhoto> wallpapers;
  final Function(int wallpaperId) onWallpaperPress;

  const WallpaperList({
    Key? key,
    required this.wallpaperCount,
    required this.wallpapers,
    required this.onWallpaperPress,
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
          String? imageUriSecond;

          var imageUriFirst = wallpapers[index].src?.medium;

          if (index != wallpapers.length - 1) {
            imageUriSecond = wallpapers[index + 1].src?.medium;
          } else {
            imageUriSecond = null;
          }

          if (imageUriFirst != null) {
            return Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(3),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    onPressed: () => onWallpaperPress(wallpapers[index].id!),
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
                ),
                if (imageUriSecond != null)
                  Padding(
                    padding: const EdgeInsets.all(3),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      onPressed: () =>
                          onWallpaperPress(wallpapers[index + 1].id!),
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
                    ),
                  )
                else
                  const SizedBox.shrink()
              ],
            );
          } else {
            return const SizedBox.shrink();
          }
        }

        return const SizedBox.shrink();
      },
    );
  }
}
