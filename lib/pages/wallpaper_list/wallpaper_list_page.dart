import 'package:artuaista/controllers/wallpaper_list_controller.dart';
import 'package:artuaista/repositories/wallpaper/implementation/wallpaper_respository_pexels.dart';
import 'package:artuaista/shared/theme/app_colors.dart';
import 'package:artuaista/shared/theme/font_size.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class WallpaperListPage extends StatefulWidget {
  final WallpaperListController _controller = WallpaperListController(
    wallpaperRepository: WallpaperRepositoryPexels(
      http.Client(),
    ),
  );

  WallpaperListPage({Key? key}) : super(key: key);

  @override
  State<WallpaperListPage> createState() => _WallpaperListPageState();
}

class _WallpaperListPageState extends State<WallpaperListPage> {
  @override
  void initState() {
    super.initState();

    widget._controller.getWallpapers();
  }

  @override
  Widget build(BuildContext context) {
    var cardSize = MediaQuery.of(context).size.width / 2 - 6;

    return Scaffold(
      body: SafeArea(
        child: AnimatedBuilder(
          animation: Listenable.merge([
            widget._controller.loadingDiscoverPhotos,
            widget._controller.discoverPhotos,
          ]),
          builder: (context, child) => Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 24,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Artuaista",
                          style: TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: FontSize.titlePlus,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Row(
                          children: [
                            const Text(
                              "with",
                              style: TextStyle(
                                color: AppColors.textPrimary,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Image.asset(
                              'drawable/images/pexels_logo_text.png',
                              width: 60,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: widget._controller.loadingDiscoverPhotos.value
                        ? const CircularProgressIndicator(
                            color: AppColors.primarySwatch,
                          )
                        : null,
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: widget._controller.discoverPhotos.value.length,
                    itemBuilder: (context, index) {
                      if (index % 2 == 0) {
                        var imageUriFirst = widget._controller.discoverPhotos
                            .value[index].src?.portrait;

                        var imageUriSecond = index !=
                                widget._controller.discoverPhotos.value.length -
                                    1
                            ? widget._controller.discoverPhotos.value[index + 1]
                                .src?.portrait
                            : null;

                        return imageUriFirst != null
                            ? Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(3),
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
                                          padding: EdgeInsets.all(3),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
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
                                      : const SizedBox()
                                ],
                              )
                            : const SizedBox();
                      }

                      return const SizedBox();
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
