import 'dart:math';

import 'package:audio_service/audio_service.dart';
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
import 'package:music_app/utils/music_player_tools/audio_stream.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

class MainScreen extends StatelessWidget {
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final BehaviorSubject<double> _dragPositionSubject =
      BehaviorSubject.seeded(null);

  Widget positionIndicator(MediaItem mediaItem, PlaybackState state) {
    double seekPos;
    return StreamBuilder(
      stream: Rx.combineLatest2<double, double, double>(
          _dragPositionSubject.stream,
          Stream.periodic(Duration(milliseconds: 200)),
          (dragPosition, _) => dragPosition),
      builder: (context, snapshot) {
        double position =
            snapshot.data ?? state.currentPosition.inMilliseconds.toDouble();
        double duration = mediaItem?.duration?.inMilliseconds?.toDouble();
        return duration != null
            ? LinearProgressIndicator(
                value: position / duration,
                valueColor: context.watch<HomeModel>().isDrawerOpend ?  AlwaysStoppedAnimation<Color>(AppColors.accent) :  AlwaysStoppedAnimation<Color>(AppColors.mainColor),
                backgroundColor: AppColors.mainColor.withOpacity(0.2),
              )
            : SizedBox();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var _fragments = [
      HomeFragment(),
      TVFragment(),
      RadioFragment(),
      NotificationFragment()
    ];
    return Scaffold(
      body: AudioServiceWidget(
        child: Column(
          children: <Widget>[
            Expanded(
                child:
                    _fragments[context.watch<MainScreenModel>().currentIndex]),
            StreamBuilder<ScreenState>(
                stream: ScreenStateStream,
                builder: (context, snapshot) {
                  final screenState = snapshot.data;
                  final queue = screenState?.queue;
                  final mediaItem = screenState?.mediaItem;
                  final state = screenState?.playbackState;
                  final processingState =
                      state?.processingState ?? AudioProcessingState.none;
                  final playing = state?.playing ?? false;

                  return processingState != AudioProcessingState.none
                      ? Container(
                          // This align moves the children to the bottom
                          child: Align(
                              alignment: FractionalOffset.bottomCenter,
                              // This container holds all the children that will be aligned
                              // on the bottom and should not scroll with the above ListView
                              child: Container(
                                height: 64,
                                decoration: BoxDecoration(
//                                    boxShadow: [
//                                      BoxShadow(
//                                          color: HexColor("#e4e9ed"),
//                                          blurRadius: 0)
//                                    ],
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        topRight: Radius.circular(5))),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      height: 2.5,
                                      child:
                                          positionIndicator(mediaItem, state),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Container(
                                              width: 60,
                                              height: 60,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(1),
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                          mediaItem.artUri),
                                                      fit: BoxFit.cover)),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    mediaItem.title,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    mediaItem.artist,
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: <Widget>[
                                            IconButton(
                                                icon:
                                                    Icon(Icons.favorite_border),
                                                onPressed: () {}),
                                            IconButton(
                                                icon: playing
                                                    ? Icon(Icons.pause)
                                                    : Icon(Icons.play_arrow),
                                                onPressed: () {
                                                  if (playing) {
                                                    AudioService.pause();
                                                  } else {
                                                    AudioService.play();
                                                  }
                                                }),
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )))
                      : SizedBox();
                })
          ],
        ),
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
