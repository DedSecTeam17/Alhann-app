import 'package:flutter/material.dart';
import 'package:music_app/screens/main_screen/fragments/home_fragment.dart';
import 'package:music_app/screens/main_screen/fragments/notification_fragment.dart';
import 'package:music_app/screens/main_screen/fragments/radio_fragment.dart';
import 'package:music_app/screens/main_screen/fragments/tv_fragment.dart';
import 'package:music_app/screens/main_screen/state/MainScreenModel.dart';
import 'package:music_app/utils/AppColors.dart';
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
      body: _fragments[context.watch<MainScreenModel>().currentIndex],
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.secondaryColor,
        elevation: 15.0,
        onPressed: () {},
        child: Image.asset("assets/images/discover.png"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
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
                  path: "assets/images/home.png", index: 0, context: context),
              title: SizedBox(),
            ),
            BottomNavigationBarItem(
              icon: _bottomImage(
                  path: "assets/images/tv.png", index: 1, context: context),
              title: SizedBox(),
            ),
            BottomNavigationBarItem(
              icon: _bottomImage(
                  path: "assets/images/radio.png", index: 2, context: context),
              title: SizedBox(),
            ),
            BottomNavigationBarItem(
              icon: _bottomImage(
                  path: "assets/images/bell.png", index: 3, context: context),
              title: SizedBox(),
            ),
          ],
        ),
      ),
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
