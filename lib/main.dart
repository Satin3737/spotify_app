import 'package:flutter/material.dart';
import 'package:spotify_app/core/configs/theme/app_theme.dart';
import 'package:spotify_app/presentation/splash/pages/splash_screen.dart';

void main() => runApp(const SpotifyApp());

class SpotifyApp extends StatelessWidget {
  const SpotifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Spotify App',
      theme: AppTheme.darkTheme,
      home: SplashScreen(),
    );
  }
}
