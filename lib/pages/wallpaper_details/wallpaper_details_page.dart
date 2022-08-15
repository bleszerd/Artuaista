import 'package:artuaista/controllers/wallpaper_details_controller.dart';
import 'package:artuaista/models/dtos/wallpaper_details_page_arguments_dto.dart';
import 'package:artuaista/pages/wallpaper_details/components/background_head_shadow_effect.dart';
import 'package:artuaista/pages/wallpaper_details/components/background_wallpaper.dart';
import 'package:artuaista/repositories/wallpaper/implementation/wallpaper_respository_pexels.dart';
import 'package:artuaista/shared/theme/app_colors.dart';
import 'package:artuaista/shared/theme/font_size.dart';
import 'package:artuaista/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:http/http.dart' as http;

class WallpaperDetailsPage extends StatefulWidget {
  const WallpaperDetailsPage({Key? key}) : super(key: key);

  @override
  State<WallpaperDetailsPage> createState() => _WallpaperDetailsPageState();
}

class _WallpaperDetailsPageState extends State<WallpaperDetailsPage> {
  final WallpaperDetailsController _wallpaperDetailsController =
      WallpaperDetailsController(
    wallpaperRepository: WallpaperRepositoryPexels(
      http.Client(),
    ),
  );

  static const platform = MethodChannel("com.example.artuaista/wallpaper");
  String _nativeHelloWorld = "No result";

  Future<void> _getNativeHelloWorld() async {
    String hello;

    try {
      final String result = await platform.invokeMethod('getHelloWorld');
      hello = "Result from native: $result";
    } on PlatformException catch (e) {
      hello = "Error on run native code";
    }

    setState(() {
      _nativeHelloWorld = hello;
      print(hello);
    });
  }

  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context)!.settings.arguments
        as WallpaperDetailsPageArgumentsDto;

    _wallpaperDetailsController.getWallpaparDetails(arguments.wallpaperId);

    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          Stack(
            children: [
              BackgroundWallpaper(
                screenSize: screenSize,
                wallpaperDetailsController: _wallpaperDetailsController,
              ),
              SafeArea(
                child: BackgroundHeadShadowEffect(
                  screenSize: screenSize,
                ),
              ),
            ],
          ),
          ValueListenableBuilder(
            valueListenable: _wallpaperDetailsController.isLoading,
            builder: (context, value, child) {
              if (_wallpaperDetailsController.isLoading.value) {
                return const Center(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(),
                  ),
                );
              }

              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(_nativeHelloWorld),
                      const Text(
                        "Photo by",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: FontSize.title,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Text(
                        _wallpaperDetailsController
                                .photoDetails.value?.photographer ??
                            "Pexels photographer",
                        textAlign: TextAlign.start,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        style: const TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: FontSize.header,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 24,
                horizontal: 16,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: AppButton(
                      height: 52,
                      backgroundColor: AppColors.primarySwatch,
                      rippleColor: AppColors.primaryVariation,
                      enabled: true,
                      onTap: () {
                        _getNativeHelloWorld();
                      },
                      borderRadius: 52,
                      child: const Text(
                        "Set wallpaper",
                        style: TextStyle(
                          fontSize: FontSize.base,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: AppButton(
                      height: 52,
                      backgroundColor: AppColors.backgroundAlpha700,
                      rippleColor: AppColors.background,
                      enabled: true,
                      onTap: () {},
                      borderRadius: 52,
                      child: const Text(
                        "Open on Pexels",
                        style: TextStyle(
                          fontSize: FontSize.base,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}