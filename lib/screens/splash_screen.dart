import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:music_app/custom_widgets/list_view_with_sticky_bttom_nav.dart';
import 'package:music_app/utils/AppColors.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
//  splash screen images
  List<String> _imagesPaths = [
    "images/splash.png",
    "images/splash_tow.png",
    "images/splash_three.png",
  ];

  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.mainColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.mainColor,
        ),
        body: ListViewWithStickyBottomNavigation(
            children: <Widget>[_prepareCarousal(), _header()],
            bottomNavigation: Padding(
              padding: const EdgeInsets.only(bottom: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FlatButton(
                      onPressed: () {},
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
                                      image: AssetImage("images/right.png")),
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

  Widget _prepareCarousal() {
    return Container(
      height: MediaQuery.of(context).size.height/2.1,

      child: Column(
        children: <Widget>[
          Container(
              child: CarouselSlider(

            options: CarouselOptions(
                enlargeCenterPage: true,
                onPageChanged: (index, reson) {
                  setState(() {
                    _current = index;
                  });
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
              return _current == index ? _selectedImage() : _unSelectedImage();
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
