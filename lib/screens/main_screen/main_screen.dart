import 'package:flutter/material.dart';
import 'package:music_app/custom_widgets/list_view_with_sticky_bttom_nav.dart';
import 'package:music_app/screens/main_screen/fragments/home_fragment.dart';
import 'package:music_app/screens/main_screen/fragments/notification_fragment.dart';
import 'package:music_app/screens/main_screen/fragments/radio_fragment.dart';
import 'package:music_app/screens/main_screen/fragments/tv_fragment.dart';
import 'package:music_app/screens/main_screen/state/MainScreenModel.dart';
import 'package:music_app/screens/main_screen/state/home_model.dart';
import 'package:music_app/utils/AppColors.dart';
import 'package:music_app/utils/hex_color.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    var _fragments = [
      HomeFragment(),
      TVFragment(),
      RadioFragment(),
      NotificationFragment()
    ];
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
              child: _fragments[context.watch<MainScreenModel>().currentIndex]),
          Container(
              // This align moves the children to the bottom
              child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  // This container holds all the children that will be aligned
                  // on the bottom and should not scroll with the above ListView
                  child: Container(
                    height: 63,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(color: HexColor("#e4e9ed"), blurRadius: 0)
                        ],
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 2.2,
                          child: LinearProgressIndicator(
                            value: 0.5,
                            valueColor: AlwaysStoppedAnimation<Color>(
                                AppColors.accent),
                             backgroundColor: AppColors.mainColor.withOpacity(0.2),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(1),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/t_2.png"),
                                          fit: BoxFit.cover)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Here We Go Again",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                IconButton(
                                    icon: Icon(Icons.favorite_border),
                                    onPressed: () {}),
                                IconButton(
                                    icon: Icon(Icons.pause), onPressed: () {}),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  )))
        ],
      ),
//      floatingActionButton: !context.watch<HomeModel>().isDrawerOpend
//          ? FloatingActionButton(
//              backgroundColor: AppColors.secondaryColor,
//              elevation: 15.0,
//              onPressed: () {},
//              child: Image.asset("assets/images/discover.png"),
//            )
//          : SizedBox(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: !context.watch<HomeModel>().isDrawerOpend
          ? BottomAppBar(
              shape: CircularNotchedRectangle(),
              color: Colors.blueGrey,
              clipBehavior: Clip.antiAlias,
              notchMargin: 2.0,
              child: BottomNavigationBar(
                onTap: (index) {
                  context.read<MainScreenModel>().changeIndex(index);
                },
                currentIndex: context.watch<MainScreenModel>().currentIndex,
                selectedItemColor: AppColors.secondaryColor,
                unselectedItemColor: Colors.grey,
                type: BottomNavigationBarType.fixed,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: _bottomImage(
                        path: "assets/images/home.png",
                        index: 0,
                        context: context),
                    title: SizedBox(),
                  ),
                  BottomNavigationBarItem(
                    icon: _bottomImage(
                        path: "assets/images/tv.png",
                        index: 1,
                        context: context),
                    title: SizedBox(),
                  ),
                  BottomNavigationBarItem(
                    icon: _bottomImage(
                        path: "assets/images/radio.png",
                        index: 2,
                        context: context),
                    title: SizedBox(),
                  ),
                  BottomNavigationBarItem(
                    icon: _bottomImage(
                        path: "assets/images/bell.png",
                        index: 3,
                        context: context),
                    title: SizedBox(),
                  ),
                ],
              ),
            )
          : SizedBox(),
    );
  }

  Widget _bottomImage({BuildContext context, index, path}) {
    return Image.asset(
      path,
      color: context.watch<MainScreenModel>().currentIndex == index
          ? AppColors.secondaryColor
          : Colors.grey,
    );
  }
}
