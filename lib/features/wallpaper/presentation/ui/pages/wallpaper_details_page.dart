import 'package:artuaista/core/data/services/http_http_service_impl.dart';
import 'package:artuaista/core/theme/app_colors.dart';
import 'package:artuaista/core/theme/font_size.dart';
import 'package:artuaista/core/widgets/appButton/app_button.dart';
import 'package:artuaista/features/wallpaper/data/dtos/set_device_wallpaper_dto.dart';
import 'package:artuaista/features/wallpaper/domain/usecases/get_wallpaper_bytes/get_wallpaper_bytes_usecase_impl.dart';
import 'package:artuaista/features/wallpaper/domain/usecases/get_wallpaper_details/get_wallpaper_details_usecase_impl.dart';
import 'package:artuaista/features/wallpaper/domain/usecases/set_device_wallpaper/set_device_wallpaper_usecase_impl.dart';
import 'package:artuaista/features/wallpaper/presentation/controllers/wallpaper_details_controller.dart';
import 'package:artuaista/features/wallpaper/presentation/ui/components/background_head_shadow_effect.dart';
import 'package:artuaista/features/wallpaper/presentation/ui/components/background_wallpaper.dart';
import 'package:artuaista/features/wallpaper/presentation/ui/components/set_options_tiles.dart';
import 'package:artuaista/features/wallpaper/data/dtos/navigationDtos/wallpaper_details_page_arguments_dto.dart';
import 'package:flutter/material.dart';

class WallpaperDetailsPage extends StatefulWidget {
  const WallpaperDetailsPage({Key? key}) : super(key: key);

  @override
  State<WallpaperDetailsPage> createState() => _WallpaperDetailsPageState();
}

class _WallpaperDetailsPageState extends State<WallpaperDetailsPage> {
  final WallpaperDetailsController _wallpaperDetailsController =
      WallpaperDetailsController(
    GetWallpaperDetailsUsecaseImpl(HttpHttpServiceImpl()),
    GetWallpaperBytesUsecaseImpl(HttpHttpServiceImpl()),
    SetDeviceWallpaperUsecaseImpl(),
  );

  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context)!.settings.arguments
        as WallpaperDetailsPageArgumentsDto;

    _wallpaperDetailsController.getWallpaparDetails(arguments.wallpaperId);

    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: _wallpaperDetailsController.isLoading,
        builder: (context, value, child) => Stack(
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
            Container(
              child: _wallpaperDetailsController.isLoading.value
                  ? SizedBox.expand(
                      child: Container(
                        color: AppColors.backgroundAlpha700,
                        child: const Center(
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      ),
                    )
                  : SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                    ),
            ),
            Container(
              child: _wallpaperDetailsController.isLoading.value
                  ? null
                  : Align(
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
                                  showModalBottomSheet(
                                    useRootNavigator: true,
                                    isScrollControlled: true,
                                    context: context,
                                    barrierColor: AppColors.backgroundAlpha700,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    builder: (context) => FractionallySizedBox(
                                      heightFactor: .5,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 32,
                                          horizontal: 8,
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              "Set wallpaper as",
                                              style: TextStyle(
                                                color:
                                                    AppColors.textPlaceholder,
                                                fontSize: FontSize.title,
                                                fontWeight: FontWeight.w200,
                                              ),
                                            ),
                                            SetOptionsTiles(
                                              onTileTap: () =>
                                                  Navigator.pop(context),
                                              setLockAndSystemWallpaper: () =>
                                                  _wallpaperDetailsController
                                                      .setWallpaper(
                                                          WallpaperFlag.all),
                                              setSystemWallpaper: () =>
                                                  _wallpaperDetailsController
                                                      .setWallpaper(
                                                          WallpaperFlag.system),
                                              setLockScreenBackground: () =>
                                                  _wallpaperDetailsController
                                                      .setWallpaper(
                                                          WallpaperFlag.lock),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
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
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
