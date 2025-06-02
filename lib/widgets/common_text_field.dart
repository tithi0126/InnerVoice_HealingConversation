import 'package:flutter/material.dart';
import 'package:innervoice/constants/app_colors.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  const CommonTextField(
      {super.key,
      this.controller,
      this.hintText,
      this.suffixIcon,
      this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
          side: BorderSide(
              width: 1, color: AppColors.mainColor, style: BorderStyle.solid)),
      color: Colors.white,
      elevation: 5,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(8),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: AppColors.hintTextColor,
            ),
            suffixIcon: suffixIcon,
            suffixIconColor: AppColors.greyColor,
            border: InputBorder.none,
            prefixIcon: prefixIcon,
            prefixIconColor: AppColors.iconColor,
          ),
        ),
      ),
    );
  }
}
