import 'package:flutter/material.dart';
import 'package:music_app/custom_widgets/album_artist_widgets.dart';
import 'package:music_app/screens/main_screen/state/home_model.dart';
import 'package:music_app/utils/router.dart';
import 'package:provider/provider.dart';

import 'album_detail_screen.dart';

class DrawerAlbumFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        primary: false,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: context.watch<HomeModel>().isDrawerOpend ? 1 : 2,
            childAspectRatio:
                context.watch<HomeModel>().isDrawerOpend ? 0.74 : 0.8),
        itemCount: 20,
        itemBuilder: (ctx, index) {
          return albumItem(context);
        });
  }
}
