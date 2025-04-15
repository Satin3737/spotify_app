import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:spotify_app/data/models/song/song.dart';
import 'package:spotify_app/domain/entities/song/song_entity.dart';

abstract class SongFirebaseService {
  List<SongEntity> parseSongsJson(QuerySnapshot<Map<String, dynamic>> data);
  Future<Either> getNewsSongs();
  Future<Either> getPlayList();
}

class SongFirebaseServiceImpl extends SongFirebaseService {
  @override
  List<SongEntity> parseSongsJson(QuerySnapshot<Map<String, dynamic>> data) {
    List<SongEntity> songs = [];

    for (var element in data.docs) {
      var songModel = SongModel.fromJson(element.data());
      songs.add(songModel.toEntity());
    }

    return songs;
  }

  @override
  Future<Either> getNewsSongs() async {
    try {
      final data = await FirebaseFirestore.instance
          .collection('songs')
          .orderBy('releaseDate', descending: true)
          .limit(3)
          .get();

      return Right(parseSongsJson(data));
    } catch (e) {
      return Left('An error occurred. Please, try again later');
    }
  }

  @override
  Future<Either> getPlayList() async {
    try {
      final data = await FirebaseFirestore.instance
          .collection('songs')
          .orderBy('releaseDate', descending: true)
          .get();

      return Right(parseSongsJson(data));
    } catch (e) {
      return Left('An error occurred. Please, try again later');
    }
  }
}
