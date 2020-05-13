import 'package:flutter/material.dart';
import 'package:music_app/utils/AppColors.dart';

propertyOrderTableRow(
    {@required IconData icon1,
    @required IconData icon2,
    @required String title1,
    @required String title2,
    @required double opacity,
    @required bool first}) {
  //TableRow
  return TableRow(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      color: AppColors.mainColor.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      icon1,
                      color: Colors.black,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      title1,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                icon2 != null
                    ? Container(
                        decoration: BoxDecoration(
                            color: AppColors.mainColor.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            icon2,
                            color: Colors.black,
                          ),
                        ))
                    : SizedBox(
                        width: 0,
                      ),
                title2 != null
                    ? Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            title2,
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      )
                    : SizedBox(
                        width: 0,
                      )
              ],
            ),
          ),
        ),
      )
    ],
  );
}
