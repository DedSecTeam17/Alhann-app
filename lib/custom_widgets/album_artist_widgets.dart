import 'package:flutter/material.dart';
import 'package:music_app/screens/main_screen/fragments/drawer_fragments/album_screens/album_detail_screen.dart';
import 'package:music_app/screens/main_screen/fragments/drawer_fragments/artists_screen/artist_detail_screen.dart';
import 'package:music_app/screens/main_screen/state/home_model.dart';
import 'package:music_app/screens/player_screen/player_screen.dart';
import 'package:music_app/utils/router.dart';
import 'package:provider/provider.dart';

Widget artistItem(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: InkWell(
      onTap: () {
        Router.to(context, ArtistDetail());
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
                      image: AssetImage(
                          "assets/images/mock_images/artist_test.jpg"),fit: BoxFit.fill)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 18.0, right: 18, top: 8, bottom: 8),
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Text(
                      "Artist name",
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
Widget albumItem(BuildContext context ) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: InkWell(
      onTap: () {
        Router.to(context, AlbumDetail());
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Container(
              padding: const EdgeInsets.all(0.0),
              width: context.read<HomeModel>().isDrawerOpend ? 150 : 180,
              height: context.read<HomeModel>().isDrawerOpend ? 150 :180,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage(
                          "assets/images/mock_images/album_img.jpg"),fit: BoxFit.fill)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 18.0, right: 18, top: 8, bottom: 8),
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Text(
                      "Album name",
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
Widget songItem(context, index) {
  return InkWell(
    onTap: () {
      Router.to(context, PlayerScreen());
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
                        "Song title ",
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8),
                      child: Text("Artist name "),
                    ),
                  ],
                ),
              ),
            ],
          ),
          PopupMenuButton<Options>(
            onSelected: (Options result) {},
            itemBuilder: (BuildContext context) => <PopupMenuEntry<Options>>[
              const PopupMenuItem<Options>(
                value: Options.AddToFav,
                child: Text('Add to favorite'),
              ),
            ],
          )
        ],
      ),
    ),
  );
}


