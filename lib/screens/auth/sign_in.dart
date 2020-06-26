import 'package:flutter/material.dart';
import 'package:music_app/custom_widgets/buttons.dart';
import 'package:music_app/custom_widgets/custom_card.dart';
import 'package:music_app/custom_widgets/text_filed.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController _identifierCtrl = new TextEditingController();
    TextEditingController _passwordCtrl = new TextEditingController();

    return Scaffold(
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height / 4,
          ),
          CustomizedCard(
            screen_margin: 20,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left : 8.0 , right:  8 ,top: 18 , bottom: 18),
                    child: Text("Sign in ".toUpperCase() , style: TextStyle( color: Colors.black , fontWeight: FontWeight.bold , fontSize: 23),),
                  ),
                  AppTextFiled(

                    btnPadding: 10,
                    controller: _identifierCtrl,
                    hint: "User name or email",
                    filedValidation: (String identifier) {
                      if (identifier.isEmpty) {
                        return "required";
                      }
                    },
                  ),
                  AppTextFiled(
                    btnPadding: 10,
                    controller: _passwordCtrl,
                    hint: "Password",
                    filedValidation: (String identifier) {
                      if (identifier.isEmpty) {
                        return "required";
                      }
                    },
                  ),
                  AppBtnWithCustomChild(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      "Sign in",
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {},
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
