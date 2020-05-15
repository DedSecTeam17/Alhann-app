import 'package:flutter/material.dart';
import 'package:music_app/screens/main_screen/fragments/home_widgets/home_widgets.dart';
import 'package:music_app/screens/main_screen/state/home_model.dart';

import '../home_fragment.dart';
import '../home_fragment_with_open_drawer.dart';
import 'package:provider/provider.dart';

class DrawerSongsFragment extends StatelessWidget {
  List tracks;

  List toptracks;

  DrawerSongsFragment({@required this.tracks, @required this.toptracks});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        !context.watch<HomeModel>().isDrawerOpend ? header() : SizedBox(),
        featuredTracksList(context: context, tracks: tracks),
        topTrackList(
            tracks: toptracks, shrink: context.watch<HomeModel>().isDrawerOpend)
      ],
    );
  }
}
