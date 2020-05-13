import 'package:flutter/material.dart';

Color getColorAccordingToStatus(String status) {
  switch (status) {
    case "open":
      return Colors.greenAccent;
      break;
    case "rented":
      return Colors.redAccent;
      break;
    case "sale":
      return Colors.deepOrange;
      break;
    case "closed":
      return Colors.red;
      break;
    default:
      return Colors.greenAccent;
  }
}

