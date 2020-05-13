import 'package:flutter/material.dart';
import 'package:music_app/utils/AppColors.dart';


class AppTextFiled extends StatelessWidget {
  TextEditingController controller;
  String hint;
  TextInputType textInputType;
  int maxLength;
  double btnPadding;
  Function filedValidation;


  AppTextFiled({this.controller, this.hint = "",this.textInputType,this.maxLength,this.btnPadding,this.filedValidation});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding:  EdgeInsets.all(btnPadding==null ? 60.0 : btnPadding),
      child: TextFormField(
        textAlign: TextAlign.center,
        validator: filedValidation,
        controller: controller,
        keyboardType: textInputType,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10),
            labelStyle: TextStyle(color: AppColors.mainColor),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: AppColors.mainColor, width: 0)),
            hintText: hint),
      ),
    );

  }
}
