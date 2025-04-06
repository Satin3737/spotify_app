import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_app/core/configs/assets/app_images.dart';
import 'package:spotify_app/core/configs/assets/app_svg.dart';
import 'package:spotify_app/core/configs/theme/app_colors.dart';
import 'package:spotify_app/core/configs/theme/app_texts.dart';

class HomeArtistCard extends StatelessWidget {
  const HomeArtistCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.centerLeft,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              spacing: 8,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'New album',
                  style: AppTexts.titleText(
                    context,
                    fontSize: 12,
                    color: AppColors.white,
                  ),
                ),
                SizedBox(
                  width: 160,
                  child: Text(
                    'Happier Than Ever',
                    style: AppTexts.titleText(
                      context,
                      fontSize: 20,
                      height: 1.2,
                      color: AppColors.white,
                    ),
                  ),
                ),
                Text(
                  'Billie Eilish',
                  style: AppTexts.titleText(
                    context,
                    fontSize: 16,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(AppSvg.homeTopPattern),
          ),
          Positioned(
            right: 48,
            bottom: 0,
            child: Image.asset(AppImages.homeArtist),
          ),
        ],
      ),
    );
  }
}
