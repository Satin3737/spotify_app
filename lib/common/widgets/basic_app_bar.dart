import 'package:flutter/material.dart';
import 'package:spotify_app/common/helpers/is_dark_mode.dart';
import 'package:spotify_app/core/configs/theme/app_colors.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BasicAppBar({super.key, this.title});

  final Widget? title;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    void onBack() {
      Navigator.pop(context);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: AppBar(
        backgroundColor: AppColors.transparent,
        scrolledUnderElevation: 0,
        elevation: 0,
        leadingWidth: 32,
        centerTitle: true,
        title: title,
        leading: IconButton(
          style: IconButton.styleFrom(
            padding: EdgeInsets.zero,
            fixedSize: const Size(32, 32),
          ),
          icon: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: context.isDark ? Color(0xFF222222) : Color(0xFFE8E8E8),
            ),
            child: Icon(
              Icons.arrow_back_ios_new,
              size: 12,
              color: context.isDark ? AppColors.white : AppColors.black,
            ),
          ),
          onPressed: onBack,
        ),
      ),
    );
  }
}
