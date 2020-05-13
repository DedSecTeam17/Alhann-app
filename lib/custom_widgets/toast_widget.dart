import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

showToast(String message, context, {bool isLong = false}) {
  Toast.show(message, context,
      duration: isLong ? Toast.LENGTH_SHORT : Toast.LENGTH_LONG,
      gravity: Toast.BOTTOM);
}
