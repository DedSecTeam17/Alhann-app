import 'package:flutter/material.dart';
import 'package:music_app/screens/main_screen/fragments/home_fragment.dart';
import 'package:music_app/screens/player_screen/player_screen.dart';
import 'package:music_app/utils/AppColors.dart';
import 'package:music_app/utils/router.dart';

Widget header() {
  return Container(
    decoration: BoxDecoration(
        color: AppColors.mainColor,
        image: DecorationImage(
            image: AssetImage("assets/images/bg_image.png"),
            fit: BoxFit.cover)),
    child: Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
                left: 18.0, right: 18, bottom: 10, top: 5),
            child: Text(
              "//TRENDING",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18.0, right: 18),
            child: Text(
              "Akcent feat Lidia Buble...",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 18.0, right: 18, bottom: 10, top: 5),
            child: Text(
              "-Kamelia",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 18.0, bottom: 20, left: 18, right: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 80,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "PLAY",
                            style: TextStyle(
                                fontSize: 10,
                                color: AppColors.mainColor,
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Image.asset(
                              "assets/images/play.png",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                            image: AssetImage(
                          "assets/images/share.png",
                        )),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}

Widget topTrackList({List<Track> tracks, bool shrink}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(
        padding:
            const EdgeInsets.only(left: 15.0, right: 15, bottom: 8, top: 8),
        child: Text(
          "Top Tracks",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      ListView.builder(
          primary: false,
          shrinkWrap: true,
          itemCount: tracks.length,
          itemBuilder: (ctx, index) {
            Track track = tracks[index];
            return SizedOverflowBox(
              size: Size(100, 100),
              child: _topTrackItem(track, shrink, ctx),
            );
          }),
    ],
  );
}

Widget _topTrackItem(Track track, bool shrink, context) {
  return InkWell(
    onTap: () {
      Router.to(context, PlayerScreen());
    },
    child: Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8, left: 18, right: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                        image: AssetImage(track.path), fit: BoxFit.cover)),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, right: 8, bottom: 3, top: 3),
                    child: Text(
                      !shrink ? track.title : track.title.substring(0, 5),
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8),
                    child: Text(
                      !shrink
                          ? track.description
                          : track.description.substring(0, 5),
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  )
                ],
              ),
            ],
          ),
          !shrink
              ? Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8),
                  child: Text(
                    track.duration,
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                )
              : SizedBox(
                  width: 0,
                )
        ],
      ),
    ),
  );
}

Widget featuredTracksList({context, tracks}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      Padding(
        padding:
            const EdgeInsets.only(left: 15.0, right: 15, bottom: 8, top: 8),
        child: Text(
          "Featured Tracks",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      SizedBox(
        height: 180,
        child: ListView.builder(
//            primary: false,
            shrinkWrap: true,
            itemCount: tracks.length,
            scrollDirection: Axis.horizontal,

//            scrollDirection: Axis.horizontal,
            itemBuilder: (ctx, index) {
              Track track = tracks[index];
              return _featuredTrackItem(track, context);
            }),
      )
    ],
  );
}

Widget _featuredTrackItem(Track track, context) {
  return InkWell(
    onTap: () {
      Router.to(context, PlayerScreen());
    },
    child: Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              width: 100,
              height: 110,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                      image: AssetImage(track.path), fit: BoxFit.fill)),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 8.0, right: 8, bottom: 3, top: 3),
            child: Text(
              track.title,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: Text(
              track.description,
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          )
        ],
      ),
    ),
  );
}
