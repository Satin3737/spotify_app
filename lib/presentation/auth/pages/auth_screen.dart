import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_app/common/helpers/is_dark_mode.dart';
import 'package:spotify_app/core/configs/assets/app_images.dart';
import 'package:spotify_app/core/configs/assets/app_svg.dart';
import 'package:spotify_app/core/configs/theme/app_colors.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void onRegister() {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const Placeholder(),
        ),
      );
    }

    void onSignIn() {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const Placeholder(),
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(AppSvg.topPattern),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(AppSvg.bottomPattern),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(AppImages.authBg),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32, right: 32, bottom: 64),
            child: Center(
              child: Column(
                spacing: 56,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AppSvg.spotifyLogo,
                    width: 240,
                  ),
                  Column(
                    spacing: 24,
                    children: [
                      Text(
                        'Enjoy listening to music',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: context.isDark
                              ? AppColors.white
                              : AppColors.black,
                          height: 1,
                        ),
                      ),
                      SizedBox(
                        width: 300,
                        child: Text(
                          'Spotify is a proprietary Swedish audio streaming and media services provider',
                          style: const TextStyle(
                            fontSize: 16,
                            color: AppColors.grey,
                            height: 1.5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Row(
                        spacing: 16,
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: onRegister,
                              child: const Text('Register'),
                            ),
                          ),
                          Expanded(
                            child: TextButton(
                              onPressed: onSignIn,
                              child: const Text('Sign in'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
