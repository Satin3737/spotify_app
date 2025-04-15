import 'package:flutter/material.dart';
import 'package:spotify_app/common/helpers/is_dark_mode.dart';

class PlayRoundBtn extends StatelessWidget {
  final double? size;
  final void Function() onPress;

  const PlayRoundBtn({
    super.key,
    this.size = 32,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(
        padding: EdgeInsets.zero,
        fixedSize: Size(size!, size!),
      ),
      icon: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: context.isDark ? Color(0xFF2C2C2C) : Color(0xFFE6E6E6),
        ),
        child: Icon(
          Icons.play_arrow_rounded,
          size: size! * 0.8,
          color: context.isDark ? Color(0xFF959595) : Color(0xFF555555),
        ),
      ),
      onPressed: onPress,
    );
  }
}
