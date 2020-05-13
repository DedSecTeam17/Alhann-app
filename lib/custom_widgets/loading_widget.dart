import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {
  Color color;

  LoadingWidget({this.color});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SpinKitFoldingCube(
      color: color != null ? color : Colors.white,
      size: 40.0,
    );
  }
}


