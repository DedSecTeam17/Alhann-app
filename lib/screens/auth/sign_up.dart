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

class SignUpScreen extends StatelessWidget {
  TextEditingController _emailCtrl = new TextEditingController();
  TextEditingController _passwordCtrl = new TextEditingController();

  TextEditingController _userName = new TextEditingController();
  var _key = GlobalKey<ScaffoldState>();
  var _form = GlobalKey<FormState>();

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
              child: Form(
                  key: _form,
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
                        textInputType: TextInputType.text,

                        filedValidation: (String identifier) {
                          if (identifier.isEmpty) {
                            return "required";
                          }
                        },
                      ),
                      AppTextFiled(
                        btnPadding: 10,
                        controller: _emailCtrl,
                        textInputType: TextInputType.emailAddress,

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
                        textInputType: TextInputType.text,

                        filedValidation: (String identifier) {
                          if (identifier.isEmpty) {
                            return "required";
                          }
                        },
                      ),
                      AppBtnWithCustomChild(
                        width: MediaQuery.of(context).size.width,
                        child: !context.watch<UserModel>().isSignUp
                            ? Text(
                                "Sign up",
                                style: TextStyle(color: Colors.white),
                              )
                            : Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: LoadingWidget(color: Colors.white,),
                            ),
                        onTap: () async {
                          if (_form.currentState.validate()) {
                            context.read<UserModel>().signUp(
                                _userName.text.trim(),
                                _emailCtrl.text.trim(),
                                _passwordCtrl.text.trim(), (done, message) {
                              if (done) {
                                Router.to(context, MainScreen());
                              } else {
                                AppSnackBar.showSnackBar(
                                    message: message, key: _key);
                              }
                            });
                          }
                        },
                      )
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
