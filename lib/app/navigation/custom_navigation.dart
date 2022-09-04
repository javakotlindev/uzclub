import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void openScreenSwipe(BuildContext context, Widget widget) {
  Navigator.push(context, CupertinoPageRoute(builder: (context) => widget));
}

void closeActiveScreen(BuildContext context) {
  Navigator.pop(context);
}

void openMainScreen(BuildContext context, Widget widget) {
  Navigator.of(context)
      .pushReplacement(CupertinoPageRoute(builder: (context) => widget));
}

void closeAllScreenAndOpenMain(BuildContext context, Widget widget) {
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => widget),
      (Route<dynamic> route) => false);
}
