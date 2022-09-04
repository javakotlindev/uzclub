import 'package:flutter/material.dart';
import 'package:uzclub/presentation/widgets/base_button.dart';
import 'package:uzclub/presentation/widgets/base_text_field.dart';

import '../../../app/utils/dimens.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Forgot Password"),
        backgroundColor: colorGreen,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
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
          Container(
              margin: EdgeInsets.all(margin_padding_16),
              child: const BaseTextField(
                labelText: "Your email",
              )),
          Wrap(
            alignment: WrapAlignment.center,
            children: [
              BaseButton(
                text: "Reset",
                function: () {},
                buttonColor: Colors.blue,
              )
            ],
          ),
        ],
      ),
    );
  }
}
