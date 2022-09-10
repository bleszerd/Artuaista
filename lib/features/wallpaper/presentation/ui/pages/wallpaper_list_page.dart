import 'package:artuaista/core/data/services/http_http_service_impl.dart';
import 'package:artuaista/features/wallpaper/data/datasource/remote/pexels/get_discover_wallpapers_pexels_remote_datasource_impl.dart';
import 'package:artuaista/features/wallpaper/data/repositories/get_discover_wallpaper_repository_impl.dart';
import 'package:artuaista/features/wallpaper/domain/usecases/get_discover_wallpapers/get_discover_wallpaper_usecase_impl.dart';
import 'package:artuaista/features/wallpaper/presentation/controllers/wallpaper_list_controller.dart';
import 'package:artuaista/features/wallpaper/presentation/ui/components/wallpaper_list.dart';
import 'package:artuaista/features/wallpaper/presentation/ui/components/wallpaper_list_fab.dart';
import 'package:artuaista/features/wallpaper/presentation/ui/components/wallpaper_list_header.dart';
import 'package:artuaista/features/wallpaper/presentation/ui/components/wallpaper_list_loading_section.dart';
import 'package:artuaista/features/wallpaper/data/dtos/navigationDtos/wallpaper_details_page_arguments_dto.dart';
import 'package:flutter/material.dart';

class WallpaperListPage extends StatefulWidget {
  final WallpaperListController _controller = WallpaperListController(
    GetDiscoverWallpaperUsecaseImpl(
      GetDiscoverWallpaperRepositoryImpl(
        GetDiscoverWallpapersPexelsRemoteDatasourceImpl(
          HttpHttpServiceImpl(),
        ),
      ),
    ),
  );

  WallpaperListPage({Key? key}) : super(key: key);

  @override
  State<WallpaperListPage> createState() => _WallpaperListPageState();
}

class _WallpaperListPageState extends State<WallpaperListPage> {
  ValueNotifier<bool> scrollToTopFabVisible = ValueNotifier<bool>(false);
  late ScrollController _wallpaperScrollController;

  @override
  void initState() {
    super.initState();

    widget._controller.getWallpapers(page: 1, refreshing: true);

    _wallpaperScrollController = ScrollController()
      ..addListener(_wallpaperScrollListener);
  }

  _wallpaperScrollListener() {
    if (_wallpaperScrollController.offset >=
            _wallpaperScrollController.position.maxScrollExtent - 380 &&
        !_wallpaperScrollController.position.outOfRange) {
      widget._controller.getWallpapers(
        page: widget._controller.currentPage + 1,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: WallpaperListFab(
        fabIsVisible: scrollToTopFabVisible,
        scrollController: _wallpaperScrollController,
      ),
      body: SafeArea(
        child: AnimatedBuilder(
          animation: Listenable.merge([
            widget._controller.loadingDiscoverPhotos,
            widget._controller.discoverPhotos,
          ]),
          builder: (context, child) =>
              NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              if (notification.metrics.pixels > 800) {
                scrollToTopFabVisible.value = true;
              } else if (scrollToTopFabVisible.value) {
                scrollToTopFabVisible.value = false;
              }

              return true;
            },
            child: SingleChildScrollView(
              controller: _wallpaperScrollController,
              child: Column(
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  WallpaperListHeader(
                    wallpaperListController: widget._controller,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  WallpaperList(
                    onWallpaperPress: (wallpaperId) {
                      Navigator.of(context).pushNamed(
                        "/wallpapeDetails",
                        arguments: WallpaperDetailsPageArgumentsDto(
                          wallpaperId: wallpaperId,
                        ),
                      );
                    },
                    wallpaperCount:
                        widget._controller.discoverPhotos.value.length,
                    wallpapers: widget._controller.discoverPhotos.value,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  WallpaperListLoadingSection(
                    isLoading: widget._controller.loadingDiscoverPhotos.value,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
