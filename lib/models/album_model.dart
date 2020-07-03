import 'package:flutter/cupertino.dart';
import 'package:music_app/services/album_service.dart';
import 'package:music_app/services/responses/all_albums_response.dart';

class AlbumModel extends ChangeNotifier {
  bool _isLoadingAlbums = true;
  List<Albums> _albums;

//  getters
  bool get isLoadingAlbums => _isLoadingAlbums;

  List<Albums> get albums => _albums;

  loadAlbums() async {
    _albums = (await AlbumService.getInstance().getAllAlbums()).albums;
    _isLoadingAlbums = false;

    notifyListeners();

    print(_albums.length.toString());
  }
}
