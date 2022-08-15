import 'package:artuaista/controllers/wallpaper_details_controller.dart';
import 'package:flutter/material.dart';

class BackgroundWallpaper extends StatelessWidget {
  final Size screenSize;
  final WallpaperDetailsController wallpaperDetailsController;

  const BackgroundWallpaper({
    Key? key,
    required this.screenSize,
    required this.wallpaperDetailsController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: wallpaperDetailsController.photoDetails,
      builder: (context, value, child) => SizedBox(
        width: screenSize.width,
        height: screenSize.height,
        child: Image.asset(
          "drawable/images/landing_background.jpg",
          fit: BoxFit.fitHeight,
        ),
        // child: wallpaperDetailsController.photoDetails.value?.src?.original !=
        //         null
        //     ? Image.network(
        //         wallpaperDetailsController.photoDetails.value!.src!.original!,
        //         fit: BoxFit.fitHeight,
        //       )
        //     : null,
      ),
    );
  }
}
