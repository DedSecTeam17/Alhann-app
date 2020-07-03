import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:music_app/custom_widgets/list_view_with_sticky_bttom_nav.dart';
import 'package:music_app/screens/main_screen/main_screen.dart';
import 'file:///F:/MobileApplicationsProjects/FlutterUiUx/music_app/lib/screens/main_screen/fragments/home_fragment.dart';
import 'package:music_app/screens/splash_screen/state/splash_model.dart';
import 'package:music_app/utils/AppColors.dart';
import 'package:music_app/utils/router.dart';
import 'package:provider/provider.dart';

//class OnBoardingScreen extends StatefulWidget {
//  @override
//  _OnBoardingScreenState createState() => _OnBoardingScreenState();
//}

class OnBoardingScreen extends StatelessWidget {
//  splash screen images
  List<String> _imagesPaths = [
    "assets/images/splash.png",
    "assets/images/splash_tow.png",
    "assets/images/splash_three.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.mainColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.mainColor,
        ),
        body: ListViewWithStickyBottomNavigation(
            children: <Widget>[_prepareCarousal(context), _header()],
            bottomNavigation: Padding(
              padding: const EdgeInsets.only(bottom: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FlatButton(
                      onPressed: () {
                        Router.to(context, MainScreen());
                      },
                      child: Row(
                        children: <Widget>[
                          Text(
                            "GET START",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 40,
                              height: 30,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/right.png")),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                          )
                        ],
                      ))
                ],
              ),
            )));
  }

  Widget _prepareCarousal(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2.1,
      child: Column(
        children: <Widget>[
          Container(
              child: CarouselSlider(
            options: CarouselOptions(
                enlargeCenterPage: true,
                onPageChanged: (index, reson) {
                  context.read<SplashModel>().changeImageIndex(index);
                }),
            items: _imagesPaths
                .map((item) => Container(
                      child: Center(
                          child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(item.toString()))),
                      )),
                      color: AppColors.mainColor,
                    ))
                .toList(),
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _imagesPaths.map((url) {
              int index = _imagesPaths.indexOf(url);
              return context.watch<SplashModel>().current == index
                  ? _selectedImage()
                  : _unSelectedImage();
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Text(
            "Listening and watching  Anytime, Anywhere  ",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: Text(
              "The artists we represent are one of the most successful in Romania and also were a huge breakthrough.",
              style: TextStyle(fontSize: 19, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _selectedImage() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(50)),
      ),
    );
  }

  Widget _unSelectedImage() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 1),
            borderRadius: BorderRadius.circular(50)),
      ),
    );
  }
}
