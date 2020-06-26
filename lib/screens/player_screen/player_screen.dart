import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_app/custom_widgets/detail_scaffold.dart';
import 'package:music_app/screens/player_screen/player_widgets.dart';
import 'package:music_app/utils/AppColors.dart';

class PlayerScreen extends StatelessWidget {

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
            SliverList(delegate: SliverChildBuilderDelegate(
                  (_, index) => player(),
              childCount: 1
            ))
          ]),
    );
  }
}
