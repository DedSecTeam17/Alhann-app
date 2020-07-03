import 'package:flutter/material.dart';
import 'package:music_app/custom_widgets/album_artist_widgets.dart';
import 'package:music_app/custom_widgets/loading_widget.dart';
import 'package:music_app/models/album_model.dart';
import 'package:music_app/screens/main_screen/state/home_model.dart';
import 'package:music_app/utils/AppColors.dart';
import 'package:music_app/utils/router.dart';
import 'package:provider/provider.dart';

import 'album_detail_screen.dart';

class DrawerAlbumFragment extends StatefulWidget {
  @override
  _DrawerAlbumFragmentState createState() => _DrawerAlbumFragmentState();
}

class _DrawerAlbumFragmentState extends State<DrawerAlbumFragment> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() => context.read<AlbumModel>().loadAlbums());
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final double itemHeight = (size.height - kToolbarHeight - 120) / 2;
    final double itemWidth = size.width / 2;

    return !context.watch<AlbumModel>().isLoadingAlbums
        ?
    GridView.builder(
            primary: false,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    context.watch<HomeModel>().isDrawerOpend ? 1 : 2,
                childAspectRatio:
                (itemWidth / itemHeight)),
            itemCount: context.watch<AlbumModel>().albums.length,
            itemBuilder: (ctx, index) {
              return albumItem(
                  context, context.read<AlbumModel>().albums.elementAt(index));
            })
        : LoadingWidget(
            color: AppColors.mainColor,
          );
  }
}
