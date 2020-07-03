import 'package:flutter/material.dart';
import 'package:music_app/services/responses/home_tracks_response.dart';
import 'package:music_app/services/tracks_service.dart';
import 'package:music_app/utils/app_logger.dart';

class TrackModel extends ChangeNotifier {
  bool _isLoadingFeaturedTracks = true;
  bool _isLoadingTopTracks = true;
  List<HomeTrack> _featuredTracks;
  List<HomeTrack> _topTracks;

//  getters
  bool get isLoadingFeaturedTracks => _isLoadingFeaturedTracks;

  bool get isLoadingTopTracks => _isLoadingTopTracks;

  List<HomeTrack> get featuredTracks => _featuredTracks;

  List<HomeTrack> get topTracks => _topTracks;

  void loadFeaturedTracks() async {
    _featuredTracks =
        (await TrackService.getInstance().getHomeTracks(Type.FEATURED))
            .featuredTracks;
    _isLoadingFeaturedTracks = false;
    notifyListeners();
  }

  void loadTopTracks() async {
    _topTracks = (await TrackService.getInstance().getHomeTracks(Type.TOP))
        .featuredTracks;
    _isLoadingTopTracks = false;
    notifyListeners();
  }
}
