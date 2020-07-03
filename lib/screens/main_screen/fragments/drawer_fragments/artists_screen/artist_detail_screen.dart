import 'package:flutter/material.dart';
import 'package:music_app/custom_widgets/album_artist_widgets.dart';
import 'package:music_app/screens/main_screen/fragments/drawer_fragments/album_screens/album_detail_screen.dart';
import 'package:music_app/services/app_graphql_client.dart';
import 'package:music_app/services/responses/all_albums_response.dart';
import 'package:music_app/services/responses/all_artists_response.dart';
import 'package:music_app/utils/AppColors.dart';
import 'package:music_app/utils/router.dart';

class ArtistDetail extends StatelessWidget {
  Artists artists;

  ArtistDetail({this.artists});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 250.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(
                baseUrl+artists.artistImageUrl.elementAt(0).url,
                fit: BoxFit.cover,
              )),
            ),
          ];
        },
        body: ListView(
          children: <Widget>[
            artistInfo(),
            _ctrl(context),
            artistAlbums(),
            artistSongs()
          ],
        ),
      ),
    );
  }

  Widget artistInfo() {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
           artists.artistName,
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8),
            child: Text(
              "${artists.albums.length} Albums . ${artists.tracks.length} songs . 23:33:01",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          )
        ],
      ),
    );
  }

  Widget artistAlbums() {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Albums",
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: AppColors.mainColor),
          ),
          Container(
            height: 150,
            child: ListView.builder(
                itemCount: artists.albums.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) {
                  return albumArtist(artists.albums.elementAt(index),ctx);
                }),
          )
        ],
      ),
    );
  }

  Widget artistSongs() {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Songs",
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: AppColors.mainColor),
          ),
          ListView.builder(
              itemCount: artists.tracks.length,
              primary: false,
              shrinkWrap: true,
              itemBuilder: (ctx, index) {
                 return artistSongItem(ctx, index + 1,artists.tracks.elementAt(0),artists);
              })
        ],
      ),
    );
  }

  Widget albumArtist(ArtistAlbums album,context) {
    return InkWell(
      onTap: (){
         Router.to(context, AlbumDetail(albums: Albums.fromJson(album.toJson())));

      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image:
                           NetworkImage(baseUrl+album.albumImageUrl.elementAt(0).url))),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8),
              child: Row(
                children: <Widget>[
                  Text(album.albumName.length>15 ? album.albumName.substring(0,15)+".." : album.albumName),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _ctrl(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
            width: MediaQuery.of(context).size.width / 2.2,
            height: 45,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/images/play.png",
                    color: Colors.white,
                    width: 35,
                    height: 35,
                  ),
                  Text(
                    "PLAY",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              color: AppColors.mainColor,
            )),
        Container(
            width: MediaQuery.of(context).size.width / 2.2,
            height: 45,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.shuffle,
                    color: Colors.white,
                  ),
                  Text(
                    "Shuffle",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              color: AppColors.mainColor,
            ))
      ],
    );
  }
}
