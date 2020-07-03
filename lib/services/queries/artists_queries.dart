class ArtistQuery {
  static String allArtists = r'''
query{
  artists(sort :"created_at:desc"){
    artist_name,
    artist_image_url{
      url
    },
    tracks{
      track_name,
      track_sound_url{
        url
      },
      track_duration,
      album{
        album_image_url{
          url
        },
        album_name
      }
    },
    albums{
         album_image_url{
      url
    },
        album_name,
    artist{
      artist_name,
      
    },
    tracks{
      track_name,track_sound_url{url},
  
    },
    }
  }
}
 ''';
}
