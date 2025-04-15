import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_app/common/widgets/play_round_btn.dart';
import 'package:spotify_app/core/configs/assets/app_images.dart';
import 'package:spotify_app/core/configs/theme/app_texts.dart';
import 'package:spotify_app/core/constants/app_urls.dart';
import 'package:spotify_app/presentation/home/bloc/news_songs_cubit.dart';
import 'package:spotify_app/presentation/home/bloc/news_songs_state.dart';

class NewsSongs extends StatelessWidget {
  const NewsSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewsSongsCubit()..getNewsSongs(),
      child: SizedBox(
        child: BlocBuilder<NewsSongsCubit, NewsSongsState>(
          builder: (context, state) {
            if (state is NewsSongsLoading) {
              return Container(
                alignment: Alignment.center,
                child: const CircularProgressIndicator(),
              );
            }

            if (state is NewsSongsData) {
              return ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 24),
                key: PageStorageKey('NewsSongs'),
                itemBuilder: (context, index) {
                  final song = state.songs[index];

                  return SizedBox(
                    width: 160,
                    child: Column(
                      spacing: 16,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              Container(
                                height: double.infinity,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(32),
                                ),
                                child: FadeInImage.assetNetwork(
                                  fit: BoxFit.cover,
                                  placeholderFit: BoxFit.contain,
                                  placeholder: AppImages.placeholder,
                                  image:
                                      '${AppUrls.firestorage}${song.artist} - ${song.title}.jpg?${AppUrls.mediaAlt}',
                                ),
                              ),
                              Align(
                                alignment: Alignment(0.9, 1.25),
                                child: PlayRoundBtn(onPress: () {}),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Column(
                            spacing: 8,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                song.title,
                                overflow: TextOverflow.ellipsis,
                                style: AppTexts.titleText(
                                  context,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                song.artist,
                                overflow: TextOverflow.ellipsis,
                                style: AppTexts.regularText(
                                  context,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                  width: 16,
                ),
                itemCount: state.songs.length,
              );
            }

            if (state is NewsSongsError) {
              return Text('Error');
            }

            return Placeholder();
          },
        ),
      ),
    );
  }
}
