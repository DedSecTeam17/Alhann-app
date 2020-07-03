enum Type { FEATURED, TOP }

class HomeTracks {
  List<HomeTrack> featuredTracks;

  HomeTracks({this.featuredTracks});

  HomeTracks.fromJson(Map<String, dynamic> json, Type type) {
    if (type == Type.FEATURED) {
      if (json['featuredTracks'] != null) {
        featuredTracks = new List<HomeTrack>();
        json['featuredTracks'].forEach((v) {
          featuredTracks.add(new HomeTrack.fromJson(v));
        });
      }
    } else {
      if (json['topTracks'] != null) {
        featuredTracks = new List<HomeTrack>();
        json['topTracks'].forEach((v) {
          featuredTracks.add(new HomeTrack.fromJson(v));
        });
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.featuredTracks != null) {
      data['featuredTracks'] =
          this.featuredTracks.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HomeTrack {
  Album album;
  Track track;
  Artist artist;

  HomeTrack({this.album, this.track, this.artist});

  HomeTrack.fromJson(Map<String, dynamic> json) {
    album = json['album'] != null ? new Album.fromJson(json['album']) : null;
    track = json['track'] != null ? new Track.fromJson(json['track']) : null;
    artist =
        json['artist'] != null ? new Artist.fromJson(json['artist']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.album != null) {
      data['album'] = this.album.toJson();
    }
    if (this.track != null) {
      data['track'] = this.track.toJson();
    }
    if (this.artist != null) {
      data['artist'] = this.artist.toJson();
    }
    return data;
  }
}

class Album {
  List<AlbumImageUrl> albumImageUrl;

  Album({this.albumImageUrl});

  Album.fromJson(Map<String, dynamic> json) {
    if (json['album_image_url'] != null) {
      albumImageUrl = new List<AlbumImageUrl>();
      json['album_image_url'].forEach((v) {
        albumImageUrl.add(new AlbumImageUrl.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.albumImageUrl != null) {
      data['album_image_url'] =
          this.albumImageUrl.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AlbumImageUrl {
  String url;

  AlbumImageUrl({this.url});

  AlbumImageUrl.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    return data;
  }
}

class Track {
  String id;
  String trackName;
  Null trackDuration;
  List<TrackSoundUrl> trackSoundUrl;

  Track({this.id, this.trackName, this.trackDuration, this.trackSoundUrl});

  Track.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    trackName = json['track_name'];
    trackDuration = json['track_duration'];
    if (json['track_sound_url'] != null) {
      trackSoundUrl = new List<TrackSoundUrl>();
      json['track_sound_url'].forEach((v) {
        trackSoundUrl.add(new TrackSoundUrl.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['track_name'] = this.trackName;
    data['track_duration'] = this.trackDuration;
    if (this.trackSoundUrl != null) {
      data['track_sound_url'] =
          this.trackSoundUrl.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TrackSoundUrl {
  String url;

  TrackSoundUrl({this.url});

  TrackSoundUrl.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    return data;
  }
}

class Artist {
  String artistName;

  Artist({this.artistName});

  Artist.fromJson(Map<String, dynamic> json) {
    artistName = json['artist_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['artist_name'] = this.artistName;
    return data;
  }
}
