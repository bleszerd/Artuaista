import 'package:artuaista/core/data/services/sharedprefs_store_service_impl.dart';
import 'package:artuaista/core/theme/app_colors.dart';
import 'package:artuaista/core/theme/font_size.dart';
import 'package:artuaista/core/widgets/flatWideButton/flat_wide_button.dart';
import 'package:artuaista/features/landing/data/datasource/local/shared_preferences/check_for_user_data_local_sharedprefs_datasource_impl.dart';
import 'package:artuaista/features/landing/data/repositories/check_for_user_data_repository_impl.dart';
import 'package:artuaista/features/landing/domain/usecases/check_for_user_data/check_for_user_data_usecase_impl.dart';
import 'package:artuaista/features/landing/domain/usecases/create_user_store/create_user_store_usecase_impl.dart';
import 'package:artuaista/features/landing/presentation/controllers/landing_controller.dart';
import 'package:artuaista/features/landing/presentation/ui/components/landing_background.dart';
import 'package:artuaista/features/landing/presentation/ui/components/landing_hero.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final LandingController _controller = LandingController(
    CreateUserStoreUsecaseImpl(
      SharedprefsStoreServiceImpl(),
    ),
    CheckForUserDataUsecaseImpl(
      CheckForUserDataRepositoryImpl(
        CheckForUserDataLocalSharedprefsDatasourceImpl(
          SharedprefsStoreServiceImpl(),
        ),
      ),
    ),
  );

  @override
  void initState() {
    _checkForUserData();

    super.initState();

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );
  }

  void _checkForUserData() {
    _controller.checkForUserData(
      (hasData) {
        if (hasData) {
          Navigator.pushReplacementNamed(
            context,
            "/wallpaperList",
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const LandingBackground(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const LandingHero(),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: FlatWideButton(
                        textStyle: const TextStyle(
                          fontSize: FontSize.base,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textPrimary,
                        ),
                        text: "Discover new wallpapers",
                        rippleColor: AppColors.primaryVariation,
                        backgroundColor: AppColors.primarySwatch,
                        onPress: () {
                          _controller.createUserStore();

                          Navigator.pushReplacementNamed(
                            context,
                            "/wallpaperList",
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
