import 'package:flutter/material.dart';
import 'package:music_app/screens/main_screen/state/home_model.dart';
import 'package:music_app/utils/AppColors.dart';

import 'package:provider/provider.dart';

Widget homeFragmentPlaceHolder(BuildContext context, Widget item) {
  return Container(
      width: MediaQuery.of(context).size.width / 2.3,
      height: MediaQuery.of(context).size.height / 1.3,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), bottomLeft: Radius.circular(15))),
      child: ListView(
//        crossAxisAlignment: CrossAxisAlignment.start,
//        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left :25.0 , top: 28, ),
            child: Text("6:34" , style: TextStyle(color: Colors.black , fontWeight: FontWeight.bold),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppBar(
              leading: FlatButton(
                  onPressed: () {
                    context.read<HomeModel>().changeDrawareState();
                  },
                  child: Image.asset(
                    "assets/images/menu.png",
                    color: Colors.black,
                  )),
              elevation: 0,
              backgroundColor: Colors.white,
            ),
          ),
          item
        ],
      ));
}

Widget drawaerList(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        drawerListItem(
            path: "assets/images/soungs.png",
            title: "Songs",
            onTap: () {
              context.read<HomeModel>().changeIndex(0);
            },
            index: 0,
            context: context),
        drawerListItem(
            path: "assets/images/album.png",
            title: "Albums",
            onTap: () {
              context.read<HomeModel>().changeIndex(1);
            },
            index: 1,
            context: context),
        drawerListItem(
            path: "assets/images/artists.png",
            title: "Artists",
            onTap: () {
              context.read<HomeModel>().changeIndex(2);
            },
            index: 2,
            context: context),
        drawerListItem(
            path: "assets/images/youtube.png",
            title: "Youtube",
            onTap: () {
              context.read<HomeModel>().changeIndex(3);
            },
            index: 3,
            context: context),
        drawerListItem(
            path: "assets/images/fav.png",
            title: "Favourites",
            onTap: () {
              context.read<HomeModel>().changeIndex(4);
            },
            index: 4,
            context: context),
        drawerListItem(
            path: "assets/images/recent_history.png",
            title: "Recent History",
            onTap: () {
              context.read<HomeModel>().changeIndex(5);
            },
            index: 5,
            context: context),
        drawerListItem(
            path: "assets/images/downloaded_items.png",
            title: "Download Items",
            onTap: () {
              context.read<HomeModel>().changeIndex(6);
            },
            index: 6,
            context: context),
        drawerListItem(
            path: "assets/images/local_files.png",
            title: "Local Files",
            onTap: () {
              context.read<HomeModel>().changeIndex(7);
            },
            index: 7,
            context: context),
      ],
    ),
  );
}

Widget drawerListItem(
    {path, title, onTap, index, @required BuildContext context}) {
  return InkWell(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8, top: 18, bottom: 18),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: Image.asset(
              path,
              color: context.watch<HomeModel>().selectedDrawerItem == index
                  ? Colors.white
                  : Colors.grey,
            ),
          ),
          Text(
            title,
            style: TextStyle(
              color: context.watch<HomeModel>().selectedDrawerItem == index
                  ? Colors.white
                  : Colors.grey,
            ),
          )
        ],
      ),
    ),
  );
}

Widget userProfile() {
  return Container(
    width: 180,
    height: 70,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(15), bottomRight: Radius.circular(15))),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          child: Image.asset("assets/images/avatar.png"),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12.0, right: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "AF Shinchan",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0, right: 5),
                    child: Image.asset("assets/images/crown.png"),
                  ),
                  Text(
                    "Premium",
                    style: TextStyle(
                        color: AppColors.secondaryColor, fontSize: 12),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    ),
  );
}
