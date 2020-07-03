class AllArtistsResponse {
  List<Artists> artists;

  AllArtistsResponse({this.artists});

  AllArtistsResponse.fromJson(Map<String, dynamic> json) {
    if (json['artists'] != null) {
      artists = new List<Artists>();
      json['artists'].forEach((v) {
        artists.add(new Artists.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.artists != null) {
      data['artists'] = this.artists.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Artists {
  String artistName;
  List<ArtistImageUrl> artistImageUrl;
  List<ArtistTracks> tracks;
  List<ArtistAlbums> albums;

  Artists({this.artistName, this.artistImageUrl, this.tracks, this.albums});

  Artists.fromJson(Map<String, dynamic> json) {
    artistName = json['artist_name'];
    if (json['artist_image_url'] != null) {
      artistImageUrl = new List<ArtistImageUrl>();
      json['artist_image_url'].forEach((v) {
        artistImageUrl.add(new ArtistImageUrl.fromJson(v));
      });
    }
    if (json['tracks'] != null) {
      tracks = new List<ArtistTracks>();
      json['tracks'].forEach((v) {
        tracks.add(new ArtistTracks.fromJson(v));
      });
    }
    if (json['albums'] != null) {
      albums = new List<ArtistAlbums>();
      json['albums'].forEach((v) {
        albums.add(new ArtistAlbums.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['artist_name'] = this.artistName;
    if (this.artistImageUrl != null) {
      data['artist_image_url'] =
          this.artistImageUrl.map((v) => v.toJson()).toList();
    }
    if (this.tracks != null) {
      data['tracks'] = this.tracks.map((v) => v.toJson()).toList();
    }
    if (this.albums != null) {
      data['albums'] = this.albums.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ArtistImageUrl {
  String url;

  ArtistImageUrl({this.url});

  ArtistImageUrl.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    return data;
  }
}

class ArtistTracks {
  String trackName;
  List<TrackSoundUrl> trackSoundUrl;
  Null trackDuration;
  Album album;

  ArtistTracks({this.trackName, this.trackSoundUrl, this.trackDuration, this.album});

  ArtistTracks.fromJson(Map<String, dynamic> json) {
    trackName = json['track_name'];
    if (json['track_sound_url'] != null) {
      trackSoundUrl = new List<TrackSoundUrl>();
      json['track_sound_url'].forEach((v) {
        trackSoundUrl.add(new TrackSoundUrl.fromJson(v));
      });
    }
    trackDuration = json['track_duration'];
    album = json['album'] != null ? new Album.fromJson(json['album']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['track_name'] = this.trackName;
    if (this.trackSoundUrl != null) {
      data['track_sound_url'] =
          this.trackSoundUrl.map((v) => v.toJson()).toList();
    }
    data['track_duration'] = this.trackDuration;
    if (this.album != null) {
      data['album'] = this.album.toJson();
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

class Album {
  List<AlbumImageUrl> albumImageUrl;
  String albumName;

  Album({this.albumImageUrl, this.albumName});

  Album.fromJson(Map<String, dynamic> json) {
    if (json['album_image_url'] != null) {
      albumImageUrl = new List<AlbumImageUrl>();
      json['album_image_url'].forEach((v) {
        albumImageUrl.add(new AlbumImageUrl.fromJson(v));
      });
    }
    albumName = json['album_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.albumImageUrl != null) {
      data['album_image_url'] =
          this.albumImageUrl.map((v) => v.toJson()).toList();
    }
    data['album_name'] = this.albumName;
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
class ArtistAlbums {
  List<AlbumImageUrl> albumImageUrl;
  String albumName;
  Artist artist;
  List<ArtistTracks> tracks;

  ArtistAlbums({this.albumImageUrl, this.albumName, this.artist, this.tracks});

  ArtistAlbums.fromJson(Map<String, dynamic> json) {
    if (json['album_image_url'] != null) {
      albumImageUrl = new List<AlbumImageUrl>();
      json['album_image_url'].forEach((v) {
        albumImageUrl.add(new AlbumImageUrl.fromJson(v));
      });
    }
    albumName = json['album_name'];
    artist =
    json['artist'] != null ? new Artist.fromJson(json['artist']) : null;
    if (json['tracks'] != null) {
      tracks = new List<ArtistTracks>();
      json['tracks'].forEach((v) {
        tracks.add(new ArtistTracks.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.albumImageUrl != null) {
      data['album_image_url'] =
          this.albumImageUrl.map((v) => v.toJson()).toList();
    }
    data['album_name'] = this.albumName;
    if (this.artist != null) {
      data['artist'] = this.artist.toJson();
    }
    if (this.tracks != null) {
      data['tracks'] = this.tracks.map((v) => v.toJson()).toList();
    }
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

