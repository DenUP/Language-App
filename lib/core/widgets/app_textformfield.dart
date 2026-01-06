import 'package:flutter/material.dart';
import 'package:language_app/core/theme/app_color.dart';
import 'package:language_app/core/theme/app_text_style.dart';

class AppTextformfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final FormFieldValidator<String>? validator;
  final Function(String) onChanged;

  const AppTextformfield({
    super.key,
    required this.controller,
    required this.hintText,
    required this.onChanged,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onChanged: onChanged,
      style: AppTextStyle.text_Regular.copyWith(color: AppColor.black),
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColor.input_bg,
        hintText: hintText,
        hintStyle: AppTextStyle.text_Regular.copyWith(
          color: AppColor.input_icon,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColor.input_stroke),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Color(0x802254F5), width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColor.input_stroke),
        ),
      ),
    );
  }
}
