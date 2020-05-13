import 'package:flutter/material.dart';
import 'package:music_app/utils/AppColors.dart';

class appRedioBtn extends StatefulWidget {
  String result = "";
  Function onChange;
//choice_a
  // ignore: non_constant_identifier_names
  String choice_a;
  String choice_b;
  String question;
  List<int> values;

  appRedioBtn(
      {this.question,
      this.choice_a,
      this.choice_b,
      this.onChange,
      this.values});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return appRadioBtnState(
        question: this.question,
        choice_a: this.choice_a,
        choice_b: this.choice_b,
        onChange: this.onChange,
        values: this.values);
  }
}

class appRadioBtnState extends State<appRedioBtn> {
  var _val = 0;
  String result = "";
  List<int> values = [1, 0];

  String choice_a;
  String choice_b;
  String question;
  Function onChange;

  appRadioBtnState(
      {this.question,
      this.choice_a,
      this.choice_b,
      this.onChange,
      this.values});

  void _handleRadioValueChange(int value) {
    setState(() {
      _val = value;

      switch (_val) {
        case 0:
          result = choice_a;
          onChange(choice_a);

          break;
        case 1:
          result = choice_b;
          onChange(choice_b);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(child: Text(question,style: TextStyle(fontWeight: FontWeight.bold),)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  new Radio(
                    activeColor: AppColors.mainColor,
                    value: 0,
                    groupValue: _val,
                    onChanged: _handleRadioValueChange,
                  ),
                  Text(choice_a)
                ],
              ),
              Row(
                children: <Widget>[

                  new Radio(
                    activeColor: AppColors.mainColor,
                    value: 1,
                    groupValue: _val,
                    onChanged: _handleRadioValueChange,
                  ),
                  Text(choice_b),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
