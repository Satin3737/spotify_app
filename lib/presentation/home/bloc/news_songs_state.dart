import 'package:spotify_app/domain/entities/song/song_entity.dart';

abstract class NewsSongsState {}

class NewsSongsLoading extends NewsSongsState {}

class NewsSongsData extends NewsSongsState {
  final List<SongEntity> songs;

  NewsSongsData({required this.songs});
}

class NewsSongsError extends NewsSongsState {}
