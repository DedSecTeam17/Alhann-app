import 'package:flutter/material.dart';
import 'package:music_app/custom_widgets/album_artist_widgets.dart';
import 'package:music_app/screens/player_screen/player_screen.dart';
import 'package:music_app/services/app_graphql_client.dart';
import 'package:music_app/services/responses/all_albums_response.dart';
import 'package:music_app/utils/AppColors.dart';
import 'package:music_app/utils/router.dart';

class AlbumDetail extends StatelessWidget {
  Albums albums;

  AlbumDetail({this.albums});

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
                    centerTitle: true,
                    title: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(albums.albumName,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          )),
                    ),
                    background: Image.network(
                      baseUrl + albums.albumImageUrl.elementAt(0).url,
                      fit: BoxFit.cover,
                    )),
              ),
            ];
          },
          body: ListView(
            children: <Widget>[
              _playAll(context),
              ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: albums.tracks.length,
                  itemBuilder: (ctx, index) {
                    return albumSongItem(
                        context,
                        index + 1,
                        albums.tracks.elementAt(index),
                        albums.artist.artistName,
                        albums.albumImageUrl.elementAt(0).url);
                  })
            ],
          )),
    );
  }

  //favorite

  Widget _playAll(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
            width: MediaQuery.of(context).size.width / 2,
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
                    "PLAY ALL",
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

enum Options { AddToFav }
