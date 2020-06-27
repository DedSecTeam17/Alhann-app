import 'package:flutter/material.dart';
import 'package:music_app/custom_widgets/album_artist_widgets.dart';
import 'package:music_app/utils/AppColors.dart';

class ArtistDetail extends StatelessWidget {
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
                  background: Image.asset(
                "assets/images/mock_images/artist_test.jpg",
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
            "Artist Name",
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8),
            child: Text(
              "2 Albums . 21 songs . 23:33:01",
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
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) {
                  return albumArtist();
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
              itemCount: 10,
              primary: false,
              shrinkWrap: true,
              itemBuilder: (ctx, index) {
                return songItem(ctx, index + 1);
              })
        ],
      ),
    );
  }

  Widget albumArtist() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image:
                        AssetImage("assets/images/mock_images/album_img.jpg"))),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8),
            child: Text("Album name"),
          )
        ],
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
