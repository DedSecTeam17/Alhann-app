import 'package:flutter/cupertino.dart';
import 'package:music_app/services/artists_service.dart';
import 'package:music_app/services/responses/all_artists_response.dart';

class ArtistModel extends ChangeNotifier {
  bool _isLoadingArtists = true;
  List<Artists> _artists;

//  getters
  bool get isLoadingArtists => _isLoadingArtists;

  List<Artists> get artists => _artists;

  loadArtists() async {
    _artists = (await ArtistService.getInstance().getAllArtists()).artists;
    _isLoadingArtists = false;
    notifyListeners();
  }
}
