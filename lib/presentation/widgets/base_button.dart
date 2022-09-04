import 'package:flutter/material.dart';
import 'package:uzclub/app/utils/dimens.dart';

class BaseButton extends StatelessWidget {
  final String text;
  final VoidCallback function;
  final Color textColor;
  final double fontSize;
  final Color buttonColor;
  final bool isButtonLoading;
  final bool isButtonEnabled;

  const BaseButton(
      {Key? key,
      required this.function,
      this.fontSize = 16,
      this.text = "Button",
      this.textColor = Colors.white,
      this.buttonColor = colorGreen,
      this.isButtonLoading = false,
      this.isButtonEnabled = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (!isButtonEnabled || isButtonLoading) ? null : function,
      style: ElevatedButton.styleFrom(
        primary:
            (!isButtonEnabled || isButtonLoading) ? Colors.grey : buttonColor,
      ),
      child: Wrap(
        children: [
          Visibility(
            visible: isButtonLoading,
            child: SizedBox(
                height: margin_padding_16,
                width: margin_padding_16,
                child: const CircularProgressIndicator(
                  color: colorGreen,
                  strokeWidth: 2,
                )),
          ),
          Visibility(
            visible: !isButtonLoading,
            child: Text(
              text,
              style: TextStyle(
                  fontSize: fontSize,
                  color: isButtonEnabled ? textColor : Colors.white10),
            ),
          )
        ],
      ),
    );
  }
}
