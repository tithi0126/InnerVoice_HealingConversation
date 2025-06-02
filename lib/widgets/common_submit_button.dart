import 'package:flutter/material.dart';
import 'package:innervoice/constants/app_colors.dart';

class CommonSubmitButton extends StatelessWidget {
  final String buttonText;
  final Widget? suffixIcon;
  final void Function() onPressed;

  const CommonSubmitButton(
      {super.key,
      required this.buttonText,
      this.suffixIcon,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(AppColors.mainColor),
          padding: WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 17))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            buttonText,
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Container(padding: EdgeInsets.all(8), child: suffixIcon),
        ],
      ),
    );
  }
}
