import 'package:artuaista/pages/wallpaper_details/components/option_tile.dart';
import 'package:flutter/material.dart';

class SetOptionsTiles extends StatelessWidget {
  final VoidCallback setSystemWallpaper;
  final VoidCallback setLockScreenBackground;
  final VoidCallback setLockAndSystemWallpaper;
  final VoidCallback onTileTap;

  const SetOptionsTiles({
    Key? key,
    required this.setSystemWallpaper,
    required this.setLockScreenBackground,
    required this.setLockAndSystemWallpaper,
    required this.onTileTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OptionTile(
          onPress: () {
            setSystemWallpaper();
            onTileTap();
          },
          iconAssetKey: "drawable/icons/system_screen_icon.svg",
          label: "Set as system wallpaper",
        ),
        const SizedBox(
          height: 8,
        ),
        OptionTile(
          onPress: () {
            setLockScreenBackground();
            onTileTap();
          },
          iconAssetKey: "drawable/icons/lock_screen_icon.svg",
          label: "Set as lock screen background",
        ),
        const SizedBox(
          height: 8,
        ),
        OptionTile(
          onPress: () {
            setLockAndSystemWallpaper();
            onTileTap();
          },
          iconAssetKey: "drawable/icons/both_screens_icon.svg",
          label: "Set at both screens",
        ),
      ],
    );
  }
}
