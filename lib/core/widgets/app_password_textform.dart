import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:language_app/core/theme/app_color.dart';
import 'package:language_app/core/theme/app_text_style.dart';

class AppPasswordTextform extends StatefulWidget {
  final TextEditingController controller;
  final Function(String) onChanged;
  final FormFieldValidator<String>? validator;
  const AppPasswordTextform({
    super.key,
    required this.controller,
    required this.onChanged,
    required this.validator,
  });

  @override
  State<AppPasswordTextform> createState() => _AppPasswordTextformState();
}

class _AppPasswordTextformState extends State<AppPasswordTextform> {
  bool isObsucure = true;

  bool get isText => widget.controller.text.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      onChanged: widget.onChanged,
      style: AppTextStyle.text_Regular.copyWith(color: AppColor.black),
      controller: widget.controller,
      obscureText: isObsucure,

      decoration: InputDecoration(
        suffixIcon: isText
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isObsucure = !isObsucure;
                  });
                },
                icon: SvgPicture.asset(
                  isObsucure ? 'assets/icons/co.svg' : "assets/icons/co-1.svg",
                ),
              )
            : null,
        filled: true,
        fillColor: AppColor.input_bg,

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
