import 'dart:math';

import 'package:khanily/model/song_model.dart';
import 'package:khanily/provider/view_state_refresh_list_model.dart';
import 'package:khanily/service/base_repository.dart';

class HomeModel extends ViewStateRefreshListModel {
  static const albumValueList = [
    'bar',
    'Nostalgia',
    'Female singer',
    'classic',
    'Popular'
  ];
  static const forYouValueList = [
    'Chinese',
    'popular',
    'Light music',
    'dashboard',
    'Vibrato'
  ];

  List<Song> _albums;
  List<Song> _forYou;
  List<Song> get albums => _albums;

  List<Song> get forYou => _forYou;
  @override
  Future<List<Song>> loadData({int pageNum}) async {
    List<Future> futures = [];
    Random r = new Random();
    int _randomSongAlbum = r.nextInt(albumValueList.length);
    int _randomSongForYou = r.nextInt(forYouValueList.length);
    String inputAlbums = albumValueList[_randomSongAlbum];
    String inputForYou = forYouValueList[_randomSongForYou];
    futures.add(BaseRepository.fetchSongList(inputAlbums, pageNum));
    futures.add(BaseRepository.fetchSongList(inputForYou, pageNum));

    var result = await Future.wait(futures);
    _albums = result[0];
    _forYou = result[1];
    return result[1];
  }
}
