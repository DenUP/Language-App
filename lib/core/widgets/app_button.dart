import 'package:flutter/material.dart';
import 'package:language_app/core/theme/app_color.dart';
import 'package:language_app/core/theme/app_text_style.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required bool isActiveButton,
    required GlobalKey<FormState> keyForm,
    required String text,
    required Widget onClick,
  }) : _isActiveButton = isActiveButton,
       _text = text,
       _keyForm = keyForm,
       _onClick = onClick;

  final bool _isActiveButton;
  final GlobalKey<FormState> _keyForm;
  final String _text;
  final Widget _onClick;

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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => _onClick),
                  );
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
