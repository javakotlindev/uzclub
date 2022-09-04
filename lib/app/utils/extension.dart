
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uzclub/app/utils/dimens.dart';

Color getColorFromHex(String hexColor) {
  hexColor = hexColor.replaceAll("#", "");
  if (hexColor.length == 6) {
    hexColor = "FF" + hexColor;
  }
  if (hexColor.length == 8) {
    return Color(int.parse("0x$hexColor"));
  }
  return Colors.red;
}

void myPrint(dynamic message) {
  if (kDebugMode) {
    print(message);
  }
}

screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

showLoadingDialog(BuildContext context, {bool isShow = true}) {
  if (isShow) {
    showGeneralDialog(
      context: context,
      // barrierColor: Colors.transparent,
      barrierColor: Colors.black.withOpacity(0.3),
      barrierDismissible: false,
      barrierLabel: "Dialog",
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (_, __, ___) {
        return const SizedBox.expand(
          child: SpinKitFadingCircle(
            size: 100,
            color: colorGreen,
          ),
        );
      },
    );
  } else {
    Navigator.pop(context);
  }
}

showToast(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: getColorFromHex('25D366'),
      textColor: Colors.white,
      fontSize: 16.0);
}

Widget loader(BuildContext context) {
  return SizedBox(
    height: screenHeight(context),
    width: screenWidth(context),
    child: const SizedBox.expand(
      child: SpinKitFadingCircle(
        size: 100,
        color: colorGreen,
      ),
    ),
  );
}

showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: colorGreen,
      content: Text(
        message,
        style: TextStyle(
          color: colorGreen,
          fontSize: font_size_14,
        ),
      ),
      duration: const Duration(seconds: 3),
    ),
  );
}
