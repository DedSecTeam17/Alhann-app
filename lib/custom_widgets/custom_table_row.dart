
import 'package:flutter/material.dart';

TableRow resultRow({String key, String propertyAval, String propertyBval}) {
  return TableRow(
//        mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            color: Colors.greenAccent.withOpacity(0.1),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                key,
                style: TextStyle(color: Colors.grey),
              ),
            )),
      ),
//          verticalDivider(),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            color: Colors.lightBlue.withOpacity(0.1),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(propertyAval),
            )),
      ),
//          verticalDivider(),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            color: Colors.deepOrangeAccent.withOpacity(0.1),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(propertyBval),
            )),
      )
    ],
  );
}
TableRow resultHeaderRow({bool isCar}) {
  return TableRow(
//        mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            color: Colors.deepOrangeAccent.withOpacity(0.8),
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.compare,
                  color: Colors.white,
                ))),
      ),
//          verticalDivider(),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            color: Colors.deepOrangeAccent.withOpacity(0.8),
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  !isCar ? Icons.home : Icons.directions_car,
                  color: Colors.white,
                ))),
      ),
//          verticalDivider(),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            color: Colors.deepOrangeAccent.withOpacity(0.8),
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  !isCar ? Icons.home : Icons.directions_car,
                  color: Colors.white,
                ))),
      )
    ],
  );
}