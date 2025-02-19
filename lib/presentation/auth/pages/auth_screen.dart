import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_app/common/widgets/basic_app_bar.dart';
import 'package:spotify_app/core/configs/assets/app_images.dart';
import 'package:spotify_app/core/configs/assets/app_svg.dart';
import 'package:spotify_app/core/configs/theme/app_texts.dart';
import 'package:spotify_app/presentation/auth/pages/auth_form_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void onRegister() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const AuthFormScreen(isRegister: true),
        ),
      );
    }

    void onSignIn() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const AuthFormScreen(isRegister: false),
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          BasicAppBar(),
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
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, bottom: 64),
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
                        style: AppTexts.titleText(context),
                      ),
                      SizedBox(
                        width: 300,
                        child: Text(
                          'Spotify is a proprietary Swedish audio streaming and media services provider',
                          style: AppTexts.descriptionText(),
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
