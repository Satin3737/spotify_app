import 'package:dartz/dartz.dart';
import 'package:spotify_app/core/usecase/usecase.dart';
import 'package:spotify_app/domain/repository/song/song_repository.dart';
import 'package:spotify_app/service_locator.dart';

class GetPlaylistUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<SongRepository>().getPlaylist();
  }
}
