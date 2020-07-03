import 'package:flutter/material.dart';
import 'package:music_app/models/user_model.dart';
import 'package:music_app/screens/main_screen/fragments/drawer_fragments/album_screens/album_detail_screen.dart';
import 'package:music_app/screens/main_screen/fragments/drawer_fragments/artists_screen/artist_detail_screen.dart';
import 'package:music_app/screens/main_screen/state/home_model.dart';
import 'package:music_app/screens/player_screen/player_screen.dart';
import 'package:music_app/services/app_graphql_client.dart';
import 'package:music_app/services/responses/all_albums_response.dart';
import 'package:music_app/services/responses/all_artists_response.dart';
import 'package:music_app/utils/router.dart';
import 'package:provider/provider.dart';

Widget artistItem(BuildContext context, Artists artists) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: InkWell(
      onTap: () {
        Router.to(context, ArtistDetail(artists: artists));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Container(
              padding: const EdgeInsets.all(0.0),
              width: context.read<HomeModel>().isDrawerOpend ? 150 : 180,
              height: context.read<HomeModel>().isDrawerOpend ? 150 : 180,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage(
                          baseUrl + artists.artistImageUrl.elementAt(0).url),
                      fit: BoxFit.cover)),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 18.0, right: 18, top: 8, bottom: 8),
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Text(
                  artists.artistName,
                  style: TextStyle(fontSize: 18),
                )),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

//album
//height
Widget albumItem(BuildContext context, Albums albums) {
  return Container(
    height: 100,
    width: 150,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Router.to(context, AlbumDetail(albums: albums));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Container(
                padding: const EdgeInsets.all(0.0),
                width: context.read<HomeModel>().isDrawerOpend ? 150 : 180,
                height: context.read<HomeModel>().isDrawerOpend ? 150 : 180,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: NetworkImage(
                            baseUrl + albums.albumImageUrl.elementAt(0).url),
                        fit: BoxFit.fill)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 18.0, right: 18, top: 8, bottom: 8),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: Text(
                    albums.albumName,
                    style: TextStyle(fontSize: 18),
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget artistSongItem(
    BuildContext context, index, ArtistTracks tracks, Artists artists) {
  return InkWell(
    onTap: () {
      Router.to(
          context,
          PlayerScreen(
            albumImageUrl:
                baseUrl + tracks.album.albumImageUrl.elementAt(0).url,
            soundUrl: baseUrl + tracks.trackSoundUrl.elementAt(0).url,
            artist: artists.artistName,
            trackName: tracks.trackName,
          ));
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(index.toString()),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        tracks.trackName,
                        style: TextStyle(
                            color: Colors.black54, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8),
                      child: Text(artists.artistName),
                    ),
                  ],
                ),
              ),
            ],
          ),
          context.read<UserModel>().isAuth
              ? PopupMenuButton<Options>(
                  onSelected: (Options result) {},
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<Options>>[
                    const PopupMenuItem<Options>(
                      value: Options.AddToFav,
                      child: Text('Add to favorite'),
                    ),
                  ],
                )
              : SizedBox()
        ],
      ),
    ),
  );
}

Widget albumSongItem(BuildContext context, index, Tracks tracks,
    String artistName, String albumUrl) {
  return InkWell(
    onTap: () {
      Router.to(
          context,
          PlayerScreen(
            albumImageUrl: baseUrl + albumUrl,
            soundUrl: baseUrl + tracks.trackSoundUrl.elementAt(0).url,
            trackName: tracks.trackName,
            artist: artistName,
          ));
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(index.toString()),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        tracks.trackName,
                        style: TextStyle(
                            color: Colors.black54, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8),
                      child: Text(artistName),
                    ),
                  ],
                ),
              ),
            ],
          ),
          context.read<UserModel>().isAuth
              ? PopupMenuButton<Options>(
                  onSelected: (Options result) {},
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<Options>>[
                    const PopupMenuItem<Options>(
                      value: Options.AddToFav,
                      child: Text('Add to favorite'),
                    ),
                  ],
                )
              : SizedBox()
        ],
      ),
    ),
  );
}
