import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class VerificationCodeTextFiled extends StatefulWidget {
  final ValueChanged<String> onCompleted;
  final TextInputType keyboardType;
  final int length;
  final double itemSize;
  BoxDecoration itemDecoration;
  TextStyle textStyle;

  VerificationCodeTextFiled(
      {Key key,
      this.onCompleted,
      this.keyboardType = TextInputType.number,
      this.length = 4,
      this.itemDecoration,
      this.itemSize = 50,
      this.textStyle = const TextStyle(fontSize: 25.0, color: Colors.black)})
      : assert(length > 0),
        assert(itemSize > 0),
        super(key: key);

  @override
  _VerificationCodeInputState createState() =>
      new _VerificationCodeInputState();
}

class _VerificationCodeInputState extends State<VerificationCodeTextFiled> {
  final List<FocusNode> _listFocusNode = <FocusNode>[];
  final List<TextEditingController> _listControllerText =
      <TextEditingController>[];
  Map<int, String> _code = Map();
  int _currentIdex = 0;

  @override
  void initState() {
    if (_listFocusNode.isEmpty) {
      for (var i = 0; i < widget.length; i++) {
        _listFocusNode.add(new FocusNode());
        _listControllerText.add(new TextEditingController());
        _code[i] = " ";
      }
    }
    super.initState();
  }

  String _getInputVerify() {
    String verifycode = '';
    for (var i = 0; i < widget.length; i++) {
      for (var index = 0; index < _listControllerText[i].text.length; index++) {
        if (_listControllerText[i].text[index] != ' ') {
          verifycode += _listControllerText[i].text[index];
        }
      }
    }
    return verifycode;
  }

  Widget _buildInputItem(int index) {
    bool border = (widget.itemDecoration == null);
    return TextField(
      
      keyboardType: widget.keyboardType,
//      maxLines: 1,
//      maxLength: 1,
      focusNode: _listFocusNode[index],
decoration: InputDecoration(
  contentPadding: EdgeInsets.all(1),

),
//      decoration: InputDecoration(
//        border: OutlineInputBorder(
//          borderRadius: BorderRadius.circular(3)
//        )
//
//      ),
      onChanged: (String value) {
        if (value.length > 1 && index < widget.length ||
            index == 0 && value.isNotEmpty) {
          if (index == widget.length - 1) {
            widget.onCompleted(_getInputVerify());
            return;
          }
          if (_listControllerText[index + 1].value.text.isEmpty) {
            _listControllerText[index + 1].value =
                new TextEditingValue(text: " ");
          }
          if (value.length == 2) {
            if (value[0] != _code[index]) {
              _code[index] = value[0];
            } else if (value[1] != _code[index]) {
              _code[index] = value[1];
            }
            if (value[0] == " ") {
              _code[index] = value[1];
            }
            _listControllerText[index].text = _code[index];
          }
          _next(index);

          return;
        }
        if (value.isEmpty && index >= 0) {
          if (_listControllerText[index - 1].value.text.isEmpty) {
            _listControllerText[index - 1].value =
                new TextEditingValue(text: " ");
          }
          _prev(index);
        }
      },
      controller: _listControllerText[index],
      maxLengthEnforced: true,
      autocorrect: false,
      textAlign: TextAlign.center,
      autofocus: true,
      style: widget.textStyle,
    );
  }

  void _next(int index) {
    if (index != widget.length) {
      setState(() {
        _currentIdex = index + 1;
      });
      FocusScope.of(context).requestFocus(_listFocusNode[index + 1]);
    }
  }

  void _prev(int index) {
    if (index > 0) {
      setState(() {
        _currentIdex = index - 1;
      });
      FocusScope.of(context).requestFocus(_listFocusNode[index - 1]);
    }
  }

  List<Widget> _buildListWidget() {
    List<Widget> listWidget = List();
    for (int index = 0; index < widget.length; index++) {
      double left = (index == 0) ? 0.0 : (widget.itemSize / 10);
      listWidget.add(Container(
          height: widget.itemSize,
          width: widget.itemSize,
          margin: EdgeInsets.only(left: left),
          decoration: widget.itemDecoration,
          child: _buildInputItem(index)));
    }
    return listWidget;
  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(60.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _buildListWidget(),
      ),
    );
  }
}
