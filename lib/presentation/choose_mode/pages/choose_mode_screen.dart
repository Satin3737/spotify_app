import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_app/core/configs/assets/app_images.dart';
import 'package:spotify_app/core/configs/assets/app_svg.dart';
import 'package:spotify_app/core/configs/theme/app_colors.dart';
import 'package:spotify_app/core/configs/theme/app_texts.dart';
import 'package:spotify_app/presentation/auth/pages/auth_screen.dart';
import 'package:spotify_app/presentation/choose_mode/widgets/mode_button_block.dart';

class ChooseModeScreen extends StatelessWidget {
  const ChooseModeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void onContinue() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const AuthScreen(),
        ),
      );
    }

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.chooseModeBg),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 8,
              left: 24,
              right: 24,
              bottom: 64,
            ),
            child: Column(
              spacing: 32,
              children: [
                SvgPicture.asset(AppSvg.spotifyLogo),
                const Spacer(),
                Column(
                  spacing: 64,
                  children: [
                    Column(
                      spacing: 32,
                      children: [
                        Text(
                          'Choose Mode',
                          textAlign: TextAlign.center,
                          style: AppTexts.titleText(
                            context,
                            fontSize: 20,
                            color: AppColors.white,
                          ),
                        ),
                        Row(
                          spacing: 48,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const ModeButtonBlock(
                              svgIcon: AppSvg.moonIcon,
                              label: 'Dark Mode',
                              mode: ThemeMode.dark,
                            ),
                            const ModeButtonBlock(
                              svgIcon: AppSvg.sunIcon,
                              label: 'Light Mode',
                              mode: ThemeMode.light,
                            ),
                          ],
                        )
                      ],
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 96),
                      ),
                      onPressed: onContinue,
                      child: const Text('Continue'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
