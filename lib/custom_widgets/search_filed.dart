import 'package:flutter/material.dart';
import 'package:music_app/custom_widgets/text_filed.dart';
import 'package:music_app/utils/AppColors.dart';

Widget searchFiled(TextEditingController _searchCtrl) {
  return Container(
    height: 70,
    decoration: BoxDecoration(
        color: AppColors.mainColor,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))),
    child: Row(
      children: <Widget>[
        Expanded(
          child: SearchTextFiled(
            btnPadding: 16,
            controller: _searchCtrl,
            hint: "artst name",
            filedValidation: (String identifier) {
              if (identifier.isEmpty) {
                return "required";
              }
            },
          ),
        ),
      ],
    ),
  );
}
