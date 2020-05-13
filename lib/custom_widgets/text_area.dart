import 'package:flutter/material.dart';

class AppTextArea extends StatefulWidget {
  var label;
  IconData icon;
  bool isPasswordFiled;
  Function filedValidation;
  TextInputType keyBoardType;
  double filed_margin;
  TextEditingController controller;


  AppTextArea(
      {this.label,
        this.icon,
        this.isPasswordFiled,
        this.filedValidation,
        this.keyBoardType,
        this.filed_margin,
        this.controller});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AppTextAreaState();
  }
}

class AppTextAreaState extends State<AppTextArea> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(
          left: 25.0,
          right: 25.0,
          top: widget.filed_margin != null ? widget.filed_margin : 20.0,bottom: 5.0),
      child: TextFormField(

        validator: widget.filedValidation,
        controller: widget.controller,
        maxLines: 2,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(3.0, 3.0, 3.0, 3.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          labelText: widget.label,
//          hintText: widget.label,
          prefixIcon: Icon(widget.icon ,size: 18,),
          suffix: widget.isPasswordFiled != null
              ? IconButton(
              icon: Icon(
                Icons.remove_red_eye,
                color: !widget.isPasswordFiled ? Colors.black : Colors.grey,
                size: 18,
              ),
              onPressed: () {
                setState(() {
                  widget.isPasswordFiled = !widget.isPasswordFiled;
                });
              })
              : IconButton(
              icon: Icon(
                Icons.remove,
                color: Colors.white,
                size: 18,
              )),
          labelStyle:
          TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
        ),
        obscureText: widget.isPasswordFiled == null
            ? false
            : widget.isPasswordFiled ? true : false,
        keyboardType: widget.keyBoardType == null
            ? TextInputType.text
            : widget.keyBoardType,
      ),
    );
  }
}
