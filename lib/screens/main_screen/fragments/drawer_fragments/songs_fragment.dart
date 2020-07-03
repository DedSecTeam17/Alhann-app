import 'package:flutter/material.dart';
import 'package:music_app/custom_widgets/loading_widget.dart';
import 'package:music_app/models/track_model.dart';
import 'package:music_app/screens/main_screen/fragments/home_widgets/home_widgets.dart';
import 'package:music_app/screens/main_screen/state/home_model.dart';
import 'package:music_app/utils/AppColors.dart';

import '../home_fragment.dart';
import '../home_fragment_with_open_drawer.dart';
import 'package:provider/provider.dart';

class DrawerSongsFragment extends StatefulWidget {
  @override
  _DrawerSongsFragmentState createState() => _DrawerSongsFragmentState();
}

class _DrawerSongsFragmentState extends State<DrawerSongsFragment> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() => context.read<TrackModel>().loadFeaturedTracks());

    Future.microtask(() => context.read<TrackModel>().loadTopTracks());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        !context.watch<HomeModel>().isDrawerOpend ? header() : SizedBox(),
        !context.watch<TrackModel>().isLoadingFeaturedTracks
            ? featuredTracksList(
                context: context,
                tracks: context.watch<TrackModel>().featuredTracks)
            : LoadingWidget(
                color: AppColors.mainColor,
              ),
        !context.watch<TrackModel>().isLoadingTopTracks
            ? topTrackList(
                tracks: context.watch<TrackModel>().topTracks,
                shrink: context.watch<HomeModel>().isDrawerOpend)
            : LoadingWidget(
                color: AppColors.mainColor,
              )
      ],
    );
  }
}
