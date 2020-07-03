import 'package:flutter/material.dart';
import 'package:music_app/custom_widgets/refresh_header.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';


Widget ListViewWithStickyBottomNavigation(
    {List<Widget> children, Widget bottomNavigation, shrink_wrap = false}) {
  return Column(
    children: <Widget>[
      Expanded(
        child: ListView(
          shrinkWrap: shrink_wrap,

          children: children,
        ),
      ),
      Container(
          // This align moves the children to the bottom
          child: Align(
              alignment: FractionalOffset.bottomCenter,
              // This container holds all the children that will be aligned
              // on the bottom and should not scroll with the above ListView
              child: bottomNavigation))
    ],
  );
}

Widget ListViewWithStickyTopNavigation(
    {List<Widget> children,
    Widget topNavigation,
    shrink_wrap = false,
    RefreshController controller,
    Function onRefresh}) {
  return Column(
    children: <Widget>[
      Container(
          // This align moves the children to the bottom
          child: Align(
              alignment: FractionalOffset.topCenter,
              // This container holds all the children that will be aligned
              // on the bottom and should not scroll with the above ListView
              child: topNavigation)),
      Expanded(
          child: SmartRefresher(
              enablePullDown: true,
              enablePullUp: false,
              header: CustomWaterDropHeader(),
              controller: controller,
              onRefresh: onRefresh,
              onLoading: () {},
              child: ListView(
//              primary: true,
                shrinkWrap: true,
                children: children,
              ))),
    ],
  );
}
