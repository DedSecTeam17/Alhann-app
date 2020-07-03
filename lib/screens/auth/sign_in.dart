import 'package:flutter/material.dart';
import 'package:music_app/custom_widgets/buttons.dart';
import 'package:music_app/custom_widgets/custom_card.dart';
import 'package:music_app/custom_widgets/loading_widget.dart';
import 'package:music_app/custom_widgets/snack_bar.dart';
import 'package:music_app/custom_widgets/text_filed.dart';
import 'package:music_app/models/user_model.dart';
import 'package:music_app/screens/main_screen/main_screen.dart';
import 'package:music_app/utils/AppColors.dart';
import 'package:music_app/utils/router.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatelessWidget {
  TextEditingController _identifierCtrl = new TextEditingController();
  TextEditingController _passwordCtrl = new TextEditingController();

  var _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
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
                      "Sign in ".toUpperCase(),
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 23),
                    ),
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
                    child: !context.watch<UserModel>().isSignIn
                        ? Text(
                            "Sign in",
                            style: TextStyle(color: Colors.white),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: LoadingWidget(
                              color: Colors.white,
                            ),
                          ),
                    onTap: () {
                      context.read<UserModel>().signIn(
                          _identifierCtrl.text.trim(),
                          _passwordCtrl.text.trim(), (done, message) {
                        if (done) {
                          Router.to(context, MainScreen());
                        } else {
                          AppSnackBar.showSnackBar(message: message, key: _key);
                        }
                      });
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
