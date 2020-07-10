import 'package:audio_service/audio_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_app/custom_widgets/detail_scaffold.dart';
import 'package:music_app/screens/player_screen/player_widgets.dart';
import 'package:music_app/utils/AppColors.dart';
import 'package:rxdart/rxdart.dart';

class PlayerScreen extends StatefulWidget {
  String albumImageUrl;
  String soundUrl;
  String artist;
  String trackName;

  PlayerScreen(
      {@required this.albumImageUrl,
      @required this.soundUrl,
      @required this.artist,
      @required this.trackName});

  @override
  _PlayerScreenState createState() => _PlayerScreenState(
      albumImageUrl: albumImageUrl,
      soundUrl: soundUrl,
      artist: artist,
      trackName: trackName);
}

class _PlayerScreenState extends State<PlayerScreen> {
  String albumImageUrl;
  String soundUrl;
  String artist;
  String trackName;

  _PlayerScreenState(
      {@required this.albumImageUrl,
      @required this.soundUrl,
      @required this.artist,
      @required this.trackName});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (AudioService.running) {
      AudioService.stop().then((value) {
        print("Stoped succcessfully");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollWithRoundedCard(
          // No appbar provided to the Scaffold, only a body with a
          // CustomScrollView.
          expandedHeight: 150.0,
          slivers: <Widget>[
            SliverAppBar(
              leading: FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Image.asset("assets/images/left.png")),
              expandedHeight: 150.0,
              backgroundColor: AppColors.mainColor,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/bg.png"),
                          fit: BoxFit.cover)),
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(
                    (_, index) => Player(
                        albumImageUrl: albumImageUrl,
                        soundUrl: soundUrl,
                        artist: artist,
                        trackName: trackName),
                    childCount: 1))
          ]),
    );
  }
}
