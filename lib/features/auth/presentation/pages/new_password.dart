import 'package:flutter/material.dart';

import 'package:language_app/core/widgets/app_button.dart';
import 'package:language_app/core/widgets/app_password_textform.dart';
import 'package:language_app/core/utils/app_validate.dart';
import 'package:language_app/features/auth/presentation/pages/pincode.dart';
import 'package:ui_kit/app_text_style.dart';
import 'package:ui_kit/ui_kit.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  final _passwordController = TextEditingController();
  final _passwordConfController = TextEditingController();
  final _keyForm = GlobalKey<FormState>();
  String? validator;

  bool get _isActiveButton =>
      _passwordConfController.text.isNotEmpty &&
      _passwordController.text.isNotEmpty;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Form(
            key: _keyForm,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 103),
                Row(
                  children: [
                    Image.asset('assets/image/Emojies.png'),
                    SizedBox(width: 16),
                    Text('Создание пароля', style: AppTextStyle.title1_Heavy),
                  ],
                ),
                SizedBox(height: 25),
                Text('Введите новый пароль', style: AppTextStyle.text_Regular),
                SizedBox(height: 64),
                Text('Новый Пароль', style: AppTextStyle.caption_Regular),
                SizedBox(height: 4),
                AppPasswordTextform(
                  controller: _passwordController,
                  onChanged: (value) => setState(() {}),
                  validator: (value) {
                    String? res = passwordValidate(value);
                    if (res == null) {
                      if (_passwordController.text !=
                          _passwordConfController.text) {
                        return 'Не равны пароли';
                      }
                    }
                    return res;
                    // if (_passwordController.text ==
                    //     _passwordConfController.text) {
                    //   return passwordValidate(value);
                    // } else {
                    //   return 'Пароли разные';
                    // }
                  },
                ),
                SizedBox(height: 14),
                Text('Пароль', style: AppTextStyle.caption_Regular),
                SizedBox(height: 4),
                AppPasswordTextform(
                  controller: _passwordConfController,
                  onChanged: (value) => setState(() {}),
                  validator: (value) {
                    if (_passwordController.text ==
                        _passwordConfController.text) {
                      return passwordValidate(value);
                    } else {
                      return 'Пароли разные';
                    }
                  },
                ),
                SizedBox(height: 14),
                AppButton(
                  isActiveButton: _isActiveButton,
                  keyForm: _keyForm,
                  text: 'Далее',
                  onClick: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Pincode()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
