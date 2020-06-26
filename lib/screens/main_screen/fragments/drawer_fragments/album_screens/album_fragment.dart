import 'package:flutter/material.dart';
import 'package:music_app/screens/main_screen/state/home_model.dart';
import 'package:provider/provider.dart';

class DrawerAlbumFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        primary: false,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: context.watch<HomeModel>().isDrawerOpend ? 1 : 2,
            childAspectRatio:context.watch<HomeModel>().isDrawerOpend  ?  0.74  : 0.8),
        itemCount: 20,
        itemBuilder: (ctx, index) {
          return _albumItem(context);
        });
  }

  Widget _albumItem(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Container(
                padding: const EdgeInsets.all(0.0),
                width: context.read<HomeModel>().isDrawerOpend  ?  150 : 180,
                height: context.read<HomeModel>().isDrawerOpend  ?  150 : 180,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage(
                            "assets/images/mock_images/album_img.jpg"))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 18.0, right: 18, top: 8, bottom: 8),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: Text(
                    "Album name",
                    style: TextStyle(fontSize: 18),
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
