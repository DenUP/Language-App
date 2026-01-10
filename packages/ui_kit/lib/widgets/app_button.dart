import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required bool isActiveButton,
    required GlobalKey<FormState> keyForm,
    required String text,
    required Function() onClick,
  }) : _isActiveButton = isActiveButton,
       _text = text,
       _keyForm = keyForm,
       _onClick = onClick;

  final bool _isActiveButton;
  final GlobalKey<FormState> _keyForm;
  final String _text;
  final Function() _onClick;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.accent,
          side: BorderSide.none,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(10),
          ),
        ),
        onPressed: _isActiveButton
            ? () {
                if (_keyForm.currentState!.validate()) {
                  _onClick();
                } else {
                  print('not validate');
                }
              }
            : null,
        child: Text(
          _text,
          style: AppTextStyle.title3_Semibold.copyWith(color: AppColor.white),
        ),
      ),
    );
  }
}
