import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uzclub/app/utils/dimens.dart';
import 'package:uzclub/presentation/screens/forgot_password/forgot_password_screen.dart';
import 'package:uzclub/presentation/screens/main/main_screen.dart';

import '../../../app/navigation/custom_navigation.dart';
import '../../widgets/base_button.dart';
import '../../widgets/base_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var isSignUp = false;
  var isLoading = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          if (isSignUp) {
            setState(() {
              isSignUp = false;
            });
          } else {
            SystemChannels.platform.invokeMethod('SystemNavigator.pop');
          }
          return false;
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              isSignUp ? "Sign up" : "Sign in",
            ),
            backgroundColor: colorGreen,
          ),
          body: Center(
            child: ListView(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: margin_padding_32),
                  child: Image.asset(
                    "assets/images/main/logo.png",
                    height: margin_padding_150,
                    width: margin_padding_150,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(vertical: margin_padding_16),
                  child: Text(
                    "UzClub",
                    style: TextStyle(
                        fontSize: font_size_24, fontWeight: FontWeight.bold),
                  ),
                ),
                Visibility(
                  visible: isSignUp,
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: margin_padding_16,
                        vertical: margin_padding_12),
                    child: const BaseTextField(labelText: "Name"),
                  ),
                ),
                Visibility(
                  visible: isSignUp,
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: margin_padding_16,
                        vertical: margin_padding_12),
                    child: const BaseTextField(labelText: "Email"),
                  ),
                ),
                Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: margin_padding_16,
                        vertical: margin_padding_12),
                    child: BaseTextField(
                        labelText:
                            isSignUp ? "Username" : "Username или Email")),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: margin_padding_16,
                      vertical: margin_padding_12),
                  child: const BaseTextField(
                    labelText: "Пароль",
                    keyBoardType: TextInputType.visiblePassword,
                    obscureText: true,
                  ),
                ),
                Visibility(
                  visible: !isSignUp,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: margin_padding_16),
                    alignment: Alignment.center,
                    child: GestureDetector(
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                            fontSize: font_size_14,
                            color: Colors.blueAccent,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        openScreenSwipe(context, const ForgotPasswordScreen());
                      },
                    ),
                  ),
                ),
                Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    BaseButton(
                      function: () {
                        setState(() {
                          openMainScreen(context, const MainScreen());
                        });
                      },
                      isButtonLoading: isLoading,
                      text: isSignUp ? "Sign up" : "Sign In",
                      buttonColor: colorGreen,
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: margin_padding_16),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: margin_padding_8),
                          height: margin_padding_20,
                          width: margin_padding_40,
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: CupertinoSwitch(
                              value: isSignUp,
                              onChanged: (value) {
                                setState(() {
                                  isSignUp = value;
                                });
                              },
                              trackColor: Colors.grey,
                              thumbColor: isSignUp ? Colors.blue : Colors.white,
                              activeColor: Colors.blueAccent,
                            ),
                          ),
                        ),
                        GestureDetector(
                          child: const Text(
                            "New to Club?",
                          ),
                          onTap: () {
                            setState(() {
                              isSignUp = !isSignUp;
                            });
                          },
                        )
                      ]),
                ),
              ],
            ),
          ),
        ));
  }
}
