import 'package:flutter/material.dart';
import 'package:music_app/utils/AppColors.dart';

Widget player() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _trackImage(),
        _trackInfo(),
        _trackOptions(),
        _timeAndSeeker(),
        _controls()
      ],
    ),
  );
}

Widget _trackImage() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/mask_group.png"))),
      )
    ],
  );
}

Widget _trackInfo() {
  return Column(
    children: <Widget>[
      Text(
        "Sucker",
        style: TextStyle(
            fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "Jonhans brotehrs",
          style: TextStyle(fontSize: 15, color: Colors.grey),
        ),
      ),
    ],
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
