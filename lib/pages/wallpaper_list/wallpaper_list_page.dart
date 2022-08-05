import 'package:artuaista/controllers/wallpaper_list_controller.dart';
import 'package:artuaista/pages/wallpaper_list/components/wallpaper_list.dart';
import 'package:artuaista/pages/wallpaper_list/components/wallpaper_list_header.dart';
import 'package:artuaista/pages/wallpaper_list/components/wallpaper_list_loading_section.dart';
import 'package:artuaista/repositories/wallpaper/implementation/wallpaper_respository_pexels.dart';
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
                    child: const WallpaperListHeader(),
                  ),
                  WallpaperListLoadingSection(
                    isLoading: widget._controller.loadingDiscoverPhotos.value,
                  ),
                  WallpaperList(
                    wallpaperCount:
                        widget._controller.discoverPhotos.value.length,
                    wallpapers: widget._controller.discoverPhotos.value,
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
