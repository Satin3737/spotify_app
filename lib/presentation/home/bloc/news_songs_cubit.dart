import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_app/domain/usecases/song/get_news_songs.dart';
import 'package:spotify_app/presentation/home/bloc/news_songs_state.dart';
import 'package:spotify_app/service_locator.dart';

class NewsSongsCubit extends Cubit<NewsSongsState> {
  NewsSongsCubit() : super(NewsSongsLoading());

  Future<void> getNewsSongs() async {
    final songs = await sl<GetNewsSongsUseCase>().call();

    songs.fold((left) {
      emit(NewsSongsError());
    }, (right) {
      emit(NewsSongsData(songs: right));
    });
  }
}
