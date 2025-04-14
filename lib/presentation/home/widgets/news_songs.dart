import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_app/common/helpers/is_dark_mode.dart';
import 'package:spotify_app/core/configs/theme/app_colors.dart';
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
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  '${AppUrls.firestorage}${song.artist} - ${song.title}.jpg?${AppUrls.mediaAlt}',
                                ),
                              ),
                            ),
                            child: Align(
                              alignment: Alignment(0.9, 1.25),
                              child: IconButton(
                                style: IconButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  fixedSize: const Size(32, 32),
                                ),
                                icon: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: context.isDark
                                        ? Color(0xFF222222)
                                        : Color(0xFFE8E8E8),
                                  ),
                                  child: Icon(
                                    Icons.play_arrow_rounded,
                                    size: 24,
                                    color: context.isDark
                                        ? AppColors.white
                                        : AppColors.black,
                                  ),
                                ),
                                onPressed: () {},
                              ),
                            ),
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
