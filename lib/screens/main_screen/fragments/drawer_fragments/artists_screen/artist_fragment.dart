import 'package:flutter/material.dart';
import 'package:music_app/custom_widgets/album_artist_widgets.dart';
import 'package:music_app/custom_widgets/loading_widget.dart';
import 'package:music_app/custom_widgets/text_filed.dart';
import 'package:music_app/models/artist_model.dart';
import 'package:music_app/screens/main_screen/fragments/drawer_fragments/album_screens/album_detail_screen.dart';
import 'package:music_app/screens/main_screen/state/home_model.dart';
import 'package:music_app/utils/AppColors.dart';
import 'package:music_app/utils/router.dart';
import 'package:provider/provider.dart';

import 'artist_detail_screen.dart';

class DrawerArtistsFragment extends StatefulWidget {
  @override
  _DrawerArtistsFragmentState createState() => _DrawerArtistsFragmentState();
}

class _DrawerArtistsFragmentState extends State<DrawerArtistsFragment> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() => context.read<ArtistModel>().loadArtists());
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final double itemHeight = (size.height - kToolbarHeight - 200) / 2;
    final double itemWidth = size.width / 2;
    return Column(
      children: <Widget>[
        !context.watch<ArtistModel>().isLoadingArtists
            ? GridView.builder(
                primary: false,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        context.watch<HomeModel>().isDrawerOpend ? 1 : 2,
                    childAspectRatio: (itemWidth / itemHeight)),
                itemCount: context.watch<ArtistModel>().artists.length,
                itemBuilder: (ctx, index) {
                  return artistItem(context,
                      context.read<ArtistModel>().artists.elementAt(index));
                })
            : Center(
                child: LoadingWidget(
                  color: AppColors.mainColor,
                ),
              ),
      ],
    );
  }
}
