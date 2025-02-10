import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_app/core/configs/assets/app_images.dart';
import 'package:spotify_app/core/configs/assets/app_svg.dart';
import 'package:spotify_app/core/configs/theme/app_colors.dart';
import 'package:spotify_app/presentation/choose_mode/pages/choose_mode_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void onGetStarted() {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const ChooseModeScreen(),
        ),
      );
    }

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.introBg),
            fit: BoxFit.fill,
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
                  spacing: 32,
                  children: [
                    Text(
                      'Enjoy listening to music',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                        height: 1,
                      ),
                    ),
                    Text(
                      'Millions of songs at your fingertips with Spotify Premium for free for 3 months with a new account and a one-time payment',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.grey,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 96),
                      ),
                      onPressed: onGetStarted,
                      child: const Text('Get started'),
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
