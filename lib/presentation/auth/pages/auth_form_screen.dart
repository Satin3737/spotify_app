import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_app/common/helpers/is_dark_mode.dart';
import 'package:spotify_app/common/widgets/basic_app_bar.dart';
import 'package:spotify_app/core/configs/assets/app_svg.dart';
import 'package:spotify_app/core/configs/theme/app_colors.dart';
import 'package:spotify_app/core/configs/theme/app_texts.dart';
import 'package:spotify_app/presentation/auth/widgets/login_form.dart';
import 'package:spotify_app/presentation/auth/widgets/register_form.dart';

class AuthFormScreen extends StatelessWidget {
  final bool isRegister;

  const AuthFormScreen({
    super.key,
    required this.isRegister,
  });

  @override
  Widget build(BuildContext context) {
    void onHelp() => print('Help');

    void onScreenChange() {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => AuthFormScreen(isRegister: !isRegister),
        ),
      );
    }

    return Scaffold(
      appBar: BasicAppBar(
        title: SvgPicture.asset(
          AppSvg.spotifyLogo,
          height: 32,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 72),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              isRegister ? 'Register' : 'Sign In',
              textAlign: TextAlign.center,
              style: AppTexts.titleText(context, fontSize: 32, height: 1.2),
            ),
            const SizedBox(height: 24),
            RichText(
              text: TextSpan(
                text: 'If You Need Any Support  ',
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.grey,
                ),
                children: [
                  WidgetSpan(
                    child: GestureDetector(
                      onTap: onHelp,
                      child: Text(
                        'click here',
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 36),
            isRegister ? RegisterForm() : LoginForm(),
            const SizedBox(height: 56),
            RichText(
              text: TextSpan(
                text: isRegister
                    ? 'Do You Have An Account?  '
                    : 'Not A Member?  ',
                style: TextStyle(
                  fontSize: 14,
                  color: context.isDark ? AppColors.white : AppColors.black,
                ),
                children: [
                  WidgetSpan(
                    child: GestureDetector(
                      onTap: onScreenChange,
                      child: Text(
                        isRegister ? 'Sign In' : 'Register',
                        style: const TextStyle(
                          color: AppColors.blue,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          height: 1.2,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
