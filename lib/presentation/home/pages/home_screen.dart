import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_app/common/widgets/basic_app_bar.dart';
import 'package:spotify_app/core/configs/assets/app_svg.dart';
import 'package:spotify_app/presentation/home/widgets/home_artist_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: SvgPicture.asset(
          AppSvg.spotifyLogo,
          height: 32,
        ),
        hideBack: true,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          spacing: 32,
          children: [
            HomeArtistCard(),
          ],
        ),
      ),
    );
  }
}
