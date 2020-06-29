import 'package:flutter/material.dart';
import 'package:music_app/custom_widgets/buttons.dart';
import 'package:music_app/custom_widgets/custom_card.dart';
import 'package:music_app/custom_widgets/text_filed.dart';
import 'package:music_app/services/auth_service.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController _emailCtrl = new TextEditingController();
    TextEditingController _passwordCtrl = new TextEditingController();

    TextEditingController _userName = new TextEditingController();

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
                    padding: const EdgeInsets.only(
                        left: 8.0, right: 8, top: 18, bottom: 18),
                    child: Text(
                      "Sign up ".toUpperCase(),
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 23),
                    ),
                  ),
                  AppTextFiled(
                    btnPadding: 10,
                    controller: _userName,
                    hint: "User name",
                    filedValidation: (String identifier) {
                      if (identifier.isEmpty) {
                        return "required";
                      }
                    },
                  ),
                  AppTextFiled(
                    btnPadding: 10,
                    controller: _emailCtrl,
                    hint: "Email",
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
                      "Sign up",
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () async {
                      await AuthService.login(
//                          userName: "Ali omer",
                          password: "mohamed",
                          identifier: "test@gmail.com");
                    },
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
