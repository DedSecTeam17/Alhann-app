import 'package:flutter/material.dart';
import 'package:music_app/custom_widgets/custom_card.dart';
import 'package:music_app/utils/AppColors.dart';
import 'package:music_app/utils/hex_color.dart';

Widget player(
    {String trackName, String artist, String albumImageUrl, String soundUrl}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _trackImage(albumImageUrl),
        _trackInfo(artist, trackName),
        _trackOptions(),
        _timeAndSeeker(),
        _controls()
      ],
    ),
  );
}

Widget _trackImage(String albumImageUrl) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(200),
            boxShadow: [BoxShadow(color: HexColor("#e4e9ed"), blurRadius: 10)],
            image: DecorationImage(image: NetworkImage(albumImageUrl))),
      )
    ],
  );
}

Widget _trackInfo(String artist, String trackName) {
  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: Column(
      children: <Widget>[
        Text(
          trackName,
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            artist,
            style: TextStyle(fontSize: 15, color: Colors.grey),
          ),
        ),
      ],
    ),
  );
}

Widget _trackOptions() {
  return Padding(
    padding: const EdgeInsets.only(top: 28.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            FlatButton(
                onPressed: () {},
                child: Image.asset("assets/images/options.png")),
            FlatButton(
                onPressed: () {},
                child: Image.asset("assets/images/download_item.png"))
          ],
        ),
        Row(
          children: <Widget>[
            FlatButton(
                onPressed: () {},
                child: Image.asset("assets/images/loading.png")),
            FlatButton(
                onPressed: () {},
                child: Image.asset("assets/images/louder.png"))
          ],
        )
      ],
    ),
  );
}

Widget _timeAndSeeker() {
  return Padding(
    padding: const EdgeInsets.only(top: 28.0, bottom: 28),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8),
          child: Text(
            "1:30",
            style: TextStyle(color: Colors.grey),
          ),
        ),
        SizedBox(
            width: 270,
            height: 5,
            child: LinearProgressIndicator(
              value: 0.5,
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.mainColor),
              backgroundColor: AppColors.greyWhite,
            )),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8),
          child: Text(
            "2:30",
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ],
    ),
  );
}

Widget _controls() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8),
        child: FlatButton(
            onPressed: () {}, child: Image.asset("assets/images/backword.png")),
      ),
      Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
            border: Border.all(
                color: AppColors.mainColor.withOpacity(0.3), width: 1),
            borderRadius: BorderRadius.circular(70),
            color: AppColors.mainColor.withOpacity(0.2)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.circular(60)),
            child: Center(
              child: FlatButton(
                  onPressed: () {},
                  child: Image.asset("assets/images/puse.png")),
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8),
        child: FlatButton(
            onPressed: () {}, child: Image.asset("assets/images/forward.png")),
      ),
    ],
  );
}
