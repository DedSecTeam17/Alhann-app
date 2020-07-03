class AlbumQuery {
  static String allAlbums = r'''
query{
  albums(sort :"created_at:desc"){
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
 ''';
}
