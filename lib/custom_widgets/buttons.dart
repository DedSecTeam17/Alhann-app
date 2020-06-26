import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:music_app/utils/AppColors.dart';
import 'package:music_app/utils/hex_color.dart';

//GradientBtn
class GradientBtn extends StatelessWidget {
  Function onTap;
  String title;
  double fontSize;

  GradientBtn(
      {@required this.onTap, @required this.title, @required this.fontSize});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        gradient: new LinearGradient(
            colors: [HexColor("#4600D5"), HexColor("#1373C1")],
            tileMode: TileMode.clamp),
      ),
      child: FlatButton(
          onPressed: onTap,
          child: Text(
            title.toUpperCase(),
            style: TextStyle(color: Colors.white, fontSize: fontSize),
          )),
    );
  }
}

class GradientBtnWithFlexSize extends StatelessWidget {
  Function onTap;
  Widget child;
  double width;

  GradientBtnWithFlexSize(
      {@required this.onTap, @required this.child, @required this.width});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: width,
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        gradient: new LinearGradient(
            colors: [HexColor("#4600D5"), HexColor("#1373C1")],
            tileMode: TileMode.clamp),
      ),
      child: FlatButton(
          onPressed: onTap,
          child: child),
    );
  }
}

//
class appBtn extends StatelessWidget {
  var text = "";
  var width = 45.0;
  var height = 56.0;
  Function onTap;

  appBtn({this.text, this.width, this.height, this.onTap});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
      margin: EdgeInsets.all(25.0),
      height: 50,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
//                    border: Border.all(color: Colors.greenAccent,width: 1.0)
      ),
      child: FlatButton(
        color: AppColors.accent,
        onPressed: onTap,
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}

class AppBtnWithCustomChild extends StatelessWidget {
  Widget child;
  var width = 50.0;
  var height = 50.0;

  Function onTap;

  AppBtnWithCustomChild({this.child, this.width, this.height, this.onTap});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        margin: EdgeInsets.all(15.0),
        height: 50,
        width: width == null ? MediaQuery.of(context).size.width : width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: FlatButton(
          color: AppColors.mainColor,
          onPressed: onTap,
          child: child,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        ));
  }
}
//
///////CupertinoButton
//
//class appBtnWithChild extends StatelessWidget {
//  Widget title;
//  var width = 50.0;
//  var height = 50.0;
//  Function onTap;
//
//  appBtnWithChild({this.title, this.width, this.height, this.onTap});
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return Container(
//      margin: EdgeInsets.all(25.0),
//      height: 50,
//      width: width == null ? MediaQuery.of(context).size.width : width,
//      decoration: BoxDecoration(
//        border: Border.all(color: Colors.grey),
//        borderRadius: BorderRadius.circular(10.0),
//      ),
//      child:  !DevicePlatform.isIOS(context) ?  FlatButton(
//        color: Colors.white,
//        onPressed: onTap,
//        child: title,
//        shape:
//            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
//      ) : CupertinoButton(
//        color: CupertinoColors.white,
//        onPressed: onTap,
//        child: title,
//
//      )
//    );
//  }
//}
//
//class appBtnWithIcon extends StatelessWidget {
//  var text = "";
//  var width = 56.0;
//  var height = 50.0;
//  Icon icon;
//  Function onTap;
//
//  appBtnWithIcon({this.icon, this.text, this.width, this.height, this.onTap});
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//
//    return Container(
//      margin: EdgeInsets.only(left: 25.0, right: 25.0, top: 25, bottom: 25),
//      height: 50,
//      width: width,
//      decoration: BoxDecoration(
//          borderRadius: BorderRadius.circular(10.0),
//          border: Border.all(color: Colors.grey)),
//      child:  !DevicePlatform.isIOS(context) ?  FlatButton(
//        onPressed: onTap,
//        child: Row(
//          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//          children: <Widget>[
//            Padding(
//              padding: const EdgeInsets.all(1.0),
//              child: icon,
//            ),
//            Expanded(
//              child: Padding(
//                padding: const EdgeInsets.all(8.0),
//                child: Text(
//                  text,
//                  style: TextStyle(color: Colors.grey, fontSize: 12),
//                ),
//              ),
//            )
//          ],
//        ),
//        shape:
//            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
//      ) : CupertinoButton(
//        onPressed: onTap,
//        child: Row(
//          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//          children: <Widget>[
//            Padding(
//              padding: const EdgeInsets.all(1.0),
//              child: icon,
//            ),
//            Expanded(
//              child: Padding(
//                padding: const EdgeInsets.all(8.0),
//                child: Text(
//                  text,
//                  style: TextStyle(color: Colors.grey, fontSize: 12),
//                ),
//              ),
//            )
//          ],
//        ),
//      ),
//    );
//  }
//}
//
//class appBtnWithBorder extends StatelessWidget {
//  var text = "";
//  var width = 56.0;
//  var height = 56.0;
//  Function onTap;
//
//  appBtnWithBorder({this.text, this.width, this.height, this.onTap});
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//
//    return  !DevicePlatform.isIOS(context) ?  Container(
//      margin: EdgeInsets.all(25.0),
//      height: 50,
//      width: width,
//      decoration: BoxDecoration(
//          borderRadius: BorderRadius.circular(10.0),
//          border: Border.all(color: AppColors.accent)
////                    border: Border.all(color: Colors.greenAccent,width: 1.0)
//          ),
//      child: FlatButton(
//        onPressed: onTap,
//        child: Text(
//          text,
//          style: TextStyle(color: AppColors.accent),
//        ),
//        shape:
//            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
//      ),
//    ) : CupertinoButton(
//      onPressed: onTap,
//      child: Text(
//        text,
//        style: TextStyle(color: AppColors.accent),
//      ),
//    );
//  }
//}
