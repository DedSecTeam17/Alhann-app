class TrackQuery {
  static String featuredTracks = r'''
query{
  featuredTracks( sort: "created_at:desc"){
    album{
      album_image_url{url}
    },
    track{
      id,track_name,track_duration,track_sound_url{url}
    }
    ,
    artist{
      artist_name
    }
  }
}
 ''';


  static String topTracks = r'''
query{
  topTracks( sort: "created_at:desc"){
    album{
      album_image_url{url}
    },
    track{
      id,track_name,track_duration,track_sound_url{url}
    }
    ,
    artist{
      artist_name
    }
  }
}
 ''';
}
