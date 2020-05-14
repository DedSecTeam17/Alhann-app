import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_app/generated/i18n.dart';
import 'package:music_app/utils/AppColors.dart';

class Track {
  String path;
  String title;
  String description;
  String duration;

  Track({this.path, this.title, this.description, this.duration});
}

class HomeFragment extends StatelessWidget {
  List<Track> _tracks = [
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

  List<Track> _Toptracks = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: ListView(
        children: <Widget>[
          _header(),
          _featuredTracksList(context),
          _topTrackList()
        ],
      ),
    );
  }

  Widget _topTrackList() {
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
            itemCount: _Toptracks.length,
            itemBuilder: (ctx, index) {
              Track track = _Toptracks[index];
              return _topTrackItem(track);
            }),
      ],
    );
  }

  Widget _topTrackItem(Track track) {
    return Padding(
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
                      track.title,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
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
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: Text(
              track.duration,
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          )
        ],
      ),
    );
  }

  Widget _featuredTracksList(context) {
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
              itemCount: _tracks.length,
              scrollDirection: Axis.horizontal,

//            scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, index) {
                Track track = _tracks[index];
                return _featuredTrackItem(track);
              }),
        )
      ],
    );
  }

  Widget _featuredTrackItem(Track track) {
    return InkWell(
      onTap: () {},
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

  Widget _header() {
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

  Widget _appBar() {
    return AppBar(
      backgroundColor: AppColors.mainColor,
      elevation: 0,
      leading: FlatButton(
        onPressed: () {},
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
