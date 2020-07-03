import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_app/custom_widgets/search_filed.dart';
import 'package:music_app/generated/i18n.dart';
import 'package:music_app/screens/main_screen/fragments/drawer_fragments/download_items.dart';
import 'package:music_app/screens/main_screen/fragments/drawer_fragments/fav_fragment.dart';
import 'package:music_app/screens/main_screen/fragments/drawer_fragments/local_files_fragments.dart';
import 'package:music_app/screens/main_screen/fragments/drawer_fragments/recent_history_fragment.dart';
import 'package:music_app/screens/main_screen/fragments/drawer_fragments/ytube_fragment.dart';
import 'package:music_app/screens/main_screen/state/home_model.dart';
import 'package:music_app/utils/AppColors.dart';

import 'drawer_fragments/album_screens/album_fragment.dart';
import 'drawer_fragments/artists_screen/artist_fragment.dart';
import 'drawer_fragments/songs_fragment.dart';
import 'home_fragment_with_open_drawer.dart';
import 'home_widgets/home_widgets.dart';
import 'package:provider/provider.dart';

class Track {
  String path;
  String title;
  String description;
  String duration;

  Track({this.path, this.title, this.description, this.duration});
}

class HomeFragment extends StatelessWidget {
  static List<Track> _tracks = [
    Track(
        path: "assets/images/t_3.png",
        title: "I Dont`t Care",
        description: "Ed shern & Bieber`s"),
    Track(
        path: "assets/images/t_2.png",
        title: "Sucker",
        description: "Jones Brothers"),
    Track(
        path: "assets/images/t_1.png",
        title: "Old Town",
        description: "Lil Nas"),
    Track(
        path: "assets/images/t_3.png",
        title: "I Dont`t Care",
        description: "Ed shern & Bieber`s"),
    Track(
        path: "assets/images/t_2.png",
        title: "Sucker",
        description: "Jones Brothers"),
    Track(
        path: "assets/images/t_1.png",
        title: "Old Town",
        description: "Lil Nas"),
  ];

  static List<Track> _Toptracks = [
    Track(
        path: "assets/images/top_1.png",
        title: "Closer (feat. Halsey)",
        description: "The Chainsmokers feat. Halsey",
        duration: "3:13"),
    Track(
        path: "assets/images/top_2.png",
        title: "7 Rings",
        description: "Ariana Grande's ",
        duration: "3:13"),
    Track(
        path: "assets/images/top_3.png",
        title: "TAKI TAKI",
        description: "Cardi B, Selena Gomez ,Ozuna",
        duration: "3:13"),
    Track(
        path: "assets/images/top_1.png",
        title: "Closer (feat. Halsey)",
        description: "The Chainsmokers feat. Halsey",
        duration: "3:13"),
    Track(
        path: "assets/images/top_2.png",
        title: "7 Rings",
        description: "Ariana Grande's ",
        duration: "3:13"),
    Track(
        path: "assets/images/top_3.png",
        title: "TAKI TAKI",
        description: "Cardi B, Selena Gomez ,Ozuna",
        duration: "3:13"),
  ];

  var drawerFragments = [
    DrawerSongsFragment(

    ),
    DrawerAlbumFragment(),
    DrawerArtistsFragment(),
    DrawerYouTubeFragment(),
    DrawerFavFragment(),
    DrawerRecentHistoryFragment(),
    DrawerDownloadItemsFragment(),
    DrawerLocalFilesFragment()
  ];
  TextEditingController _searchCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: !context
          .watch<HomeModel>()
          .isDrawerOpend
          ? _appBar(context)
          : AppBar(
        backgroundColor: AppColors.mainColor,
        elevation: 0,
        leading: SizedBox(),
      ),
      body: !context
          .watch<HomeModel>()
          .isDrawerOpend
          ? ListView(
        children: <Widget>[
          context
              .watch<HomeModel>()
              .selectedDrawerItem == 1 || context
              .watch<HomeModel>()
              .selectedDrawerItem == 2 ? Padding(
                padding: const EdgeInsets.only(bottom : 18.0),
                child: searchFiled(_searchCtrl),
              ) : SizedBox(),
          drawerFragments[context
              .watch<HomeModel>()
              .selectedDrawerItem]
        ],
      )
          : Container(
        color: AppColors.mainColor,
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            userProfile(),
                            drawaerList(context),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 4.0, right: 4, top: 0),
                        child: FlatButton(
                            onPressed: () {},
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 4.0, right: 4),
                                  child: Image.asset(
                                      "assets/images/exit.png"),
                                ),
                                Text(
                                  "Sign Out",
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            )),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width / 22,
                ),
                homeFragmentPlaceHolder(
                    context,
                    drawerFragments[
                    context
                        .watch<HomeModel>()
                        .selectedDrawerItem])
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.mainColor,
      elevation: 0,
      leading: FlatButton(
        onPressed: () {
          context.read<HomeModel>().changeDrawareState();
        },
        child: Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
              image:
              DecorationImage(image: AssetImage("assets/images/menu.png"))),
        ),
      ),
    );
  }
}
