import 'package:flutter/material.dart';

//CustomDropDownMenu
class CustomDropDownMenu extends StatefulWidget {
  final Function onItemChange;
  var title;
  String selectedMenuItem;

  var dataList = [];
  String hint;

  CustomDropDownMenu(
      {@required this.hint, @required this.onItemChange,@required this.dataList,@required this.selectedMenuItem});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CustomDropDownMenuState(
        onItemChange: onItemChange,
        dataList: dataList,
        hint: this.hint,
        selectedMenuItem: selectedMenuItem);
  }
}

class CustomDropDownMenuState extends State<CustomDropDownMenu> {
  String selectedMenuItem = "";
  final Function onItemChange;
  var dataList = [];
  String hint;

  CustomDropDownMenuState(
      {this.onItemChange, this.dataList, this.selectedMenuItem ,this.hint});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new Container(
        child: Column(
      children: <Widget>[
        Container(

          child: Padding(
            padding: const EdgeInsets.only(top : 40.0),
            child: new DropdownButton<String>(
              hint: Text(this.hint),
              items: dataList.map((listItem) {
                return new DropdownMenuItem<String>(
                    value: listItem, child: Text(listItem));
              }).toList(),
              onChanged: (String text) {
                setState(() {
                  selectedMenuItem = text;
                  onItemChange(text);
                });
              },
              value: selectedMenuItem,
              style: TextStyle(fontFamily: 'AbrilFatface', color: Colors.black),
            ),
          ),
        )
      ],
    ));
  }
}
//CustomDropDownMenu
class CustomDropDownMenuWithFullWidth extends StatefulWidget {
  final Function onItemChange;
  var title;
  String selectedMenuItem;
  String hint;

  var dataList = [];

  CustomDropDownMenuWithFullWidth(
      {this.title, this.onItemChange, this.dataList, this.selectedMenuItem,this.hint});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CustomDropDownMenuFullWidthState(
        title: this.title,
        onItemChange: onItemChange,
        dataList: dataList,
        hint: hint,
        selectedMenuItem: selectedMenuItem);
  }
}
class CustomDropDownMenuFullWidthState extends State<CustomDropDownMenuWithFullWidth> {
  String selectedMenuItem = "";
  final Function onItemChange;
  var dataList = [];
  var title;
  String hint;

  CustomDropDownMenuFullWidthState(
      {this.title, this.onItemChange, this.dataList, this.selectedMenuItem,this.hint});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new Container(

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
         boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5))]
      ),
        child: Column(
          children: <Widget>[

            Container(
              width: MediaQuery.of(context).size.width,

              child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: DropdownButtonHideUnderline(
                    child: new DropdownButton<String>(
                       hint: Text(this.hint),
                      items: dataList.map((listItem) {
                        return new DropdownMenuItem<String>(
                            value: listItem, child: Text(listItem));
                      }).toList(),
                      onChanged: (String text) {
                        setState(() {
                          selectedMenuItem = text;
                          onItemChange(text);
                        });
                      },
                      value: selectedMenuItem,
                      style: TextStyle(
                          fontFamily: 'AbrilFatface', color: Colors.black),
                    ),
                  )),
            )
          ],
        ));
  }
}
