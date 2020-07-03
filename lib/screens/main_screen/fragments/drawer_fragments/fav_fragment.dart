import 'package:flutter/material.dart';
import 'package:music_app/models/user_model.dart';
import 'package:music_app/screens/auth/sign_in.dart';
import 'package:music_app/screens/main_screen/fragments/home_fragment.dart';
import 'package:music_app/screens/main_screen/state/home_model.dart';
import 'package:music_app/screens/player_screen/player_screen.dart';
import 'package:music_app/utils/AppColors.dart';
import 'package:music_app/utils/router.dart';
import 'package:provider/provider.dart';

class DrawerFavFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return context.watch<UserModel>().isAuth
        ? ListView.builder(
            primary: false,
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (ctx, index) {
              return favItem(
                  context,
                  new Track(
                      title: "Song name",
                      description: "Artist name",
                      duration: "2:03"),
                  context.read<HomeModel>().isDrawerOpend);
            })
        : Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: EdgeInsets.only(
                    top: !context.watch<HomeModel>().isDrawerOpend
                        ? MediaQuery.of(context).size.height / 2.8
                        : MediaQuery.of(context).size.height / 6),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Sign in to add songs to your favorites"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        onPressed: () {
                          Router.to(context, SignInScreen());
                        },
                        child: Text(
                          "Sign In",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: AppColors.mainColor,
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
  }

  Widget favItem(BuildContext context, Track track, bool shrink) {
    return InkWell(
      onTap: () {
        Router.to(context, PlayerScreen());
      },
      child: Container(
        margin: EdgeInsets.only(left: 8, right: 8, bottom: 2, top: 2),
        decoration: BoxDecoration(
            color: AppColors.mainColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 0.0, bottom: 0, left: 0, right: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    width: 65,
                    height: 65,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                            image: AssetImage("assets/images/top_1.png"),
                            fit: BoxFit.cover)),
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
                  ? Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8),
                          child: Text(
                            track.duration,
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                        ),
                        IconButton(
                            icon: Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                            onPressed: () {})
                      ],
                    )
                  : SizedBox(
                      width: 0,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
