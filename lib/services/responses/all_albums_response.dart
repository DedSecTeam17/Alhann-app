class AllAlbums {
  List<Albums> albums;

  AllAlbums({this.albums});

  AllAlbums.fromJson(Map<String, dynamic> json) {
    if (json['albums'] != null) {
      albums = new List<Albums>();
      json['albums'].forEach((v) {
        albums.add(new Albums.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.albums != null) {
      data['albums'] = this.albums.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Albums {
  List<AlbumImageUrl> albumImageUrl;
  AlbumArtist artist;
  String albumName;
  List<Tracks> tracks;

  Albums({this.albumImageUrl, this.artist, this.tracks});

  Albums.fromJson(Map<String, dynamic> json) {
    albumName = json["album_name"];
    if (json['album_image_url'] != null) {
      albumImageUrl = new List<AlbumImageUrl>();
      json['album_image_url'].forEach((v) {
        albumImageUrl.add(new AlbumImageUrl.fromJson(v));
      });
    }
    artist =
        json['artist'] != null ? new AlbumArtist.fromJson(json['artist']) : null;
    if (json['tracks'] != null) {
      tracks = new List<Tracks>();
      json['tracks'].forEach((v) {
        tracks.add(new Tracks.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['album_name'] = this.albumName;

    if (this.albumImageUrl != null) {
      data['album_image_url'] =
          this.albumImageUrl.map((v) => v.toJson()).toList();
    }
    if (this.artist != null) {
      data['artist'] = this.artist.toJson();
    }
    if (this.tracks != null) {
      data['tracks'] = this.tracks.map((v) => v.toJson()).toList();
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

class AlbumArtist {
  String artistName;

  AlbumArtist({this.artistName});

  AlbumArtist.fromJson(Map<String, dynamic> json) {
    artistName = json['artist_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['artist_name'] = this.artistName;
    return data;
  }
}

class Tracks {
  String trackName;
  List<TrackSoundUrl> trackSoundUrl;

  Tracks({this.trackName, this.trackSoundUrl});

  Tracks.fromJson(Map<String, dynamic> json) {
    trackName = json['track_name'];
    if (json['track_sound_url'] != null) {
      trackSoundUrl = new List<TrackSoundUrl>();
      json['track_sound_url'].forEach((v) {
        trackSoundUrl.add(new TrackSoundUrl.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['track_name'] = this.trackName;
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
