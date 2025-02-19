import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_app/core/configs/theme/app_colors.dart';
import 'package:spotify_app/presentation/choose_mode/bloc/theme_cubit.dart';

class ModeButtonBlock extends StatelessWidget {
  const ModeButtonBlock({
    super.key,
    required this.svgIcon,
    required this.label,
    required this.mode,
  });

  final String svgIcon;
  final String label;
  final ThemeMode mode;

  @override
  Widget build(BuildContext context) {
    final currentMode = context.watch<ThemeCubit>().state;

    return Column(
      spacing: 16,
      children: [
        IconButton(
          onPressed: () {
            context.read<ThemeCubit>().toggleTheme(mode);
          },
          icon: SizedBox(
            height: 84,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: currentMode == mode
                          ? AppColors.primary
                          : AppColors.transparent,
                    ),
                    child: const SizedBox(
                      width: 32,
                      height: 32,
                    ),
                  ),
                ),
                Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        AppColors.transparent,
                        AppColors.transparent,
                        currentMode == mode
                            ? AppColors.primary
                            : AppColors.transparent
                      ],
                    ),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 40,
                      sigmaY: 40,
                    ),
                    child: const SizedBox(
                      width: 72,
                      height: 72,
                    ),
                  ),
                ),
                SvgPicture.asset(svgIcon),
              ],
            ),
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.white,
          ),
        ),
      ],
    );
  }
}
