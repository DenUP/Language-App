import 'package:flutter/material.dart';
import 'package:language_app/core/theme/app_color.dart';
import 'package:language_app/core/theme/app_text_style.dart';
import 'package:language_app/core/widgets/app_button.dart';
import 'package:language_app/core/widgets/app_password_textform.dart';
import 'package:language_app/core/widgets/app_textformfield.dart';
import 'package:language_app/core/widgets/social_button.dart';
import 'package:language_app/core/utils/app_validate.dart';
import 'package:language_app/features/pincode/presentation/pincode_page.dart';

class AuthPages extends StatefulWidget {
  const AuthPages({super.key});

  @override
  State<AuthPages> createState() => _AuthPagesState();
}

class _AuthPagesState extends State<AuthPages> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _keyForm = GlobalKey<FormState>();

  bool get _isActiveButton =>
      _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;
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
                    Text('Добро пожаловать!', style: AppTextStyle.title1_Heavy),
                  ],
                ),
                SizedBox(height: 25),
                Text(
                  'Войдите, чтобы пользоваться функциями\nприложения',
                  style: AppTextStyle.text_Regular,
                ),
                SizedBox(height: 64),
                Text('Вход по E-mail', style: AppTextStyle.caption_Regular),
                SizedBox(height: 4),
                AppTextformfield(
                  controller: _emailController,
                  hintText: "example@mail.com",
                  onChanged: (value) => setState(() {}),
                  validator: emailValidate,
                ),
                SizedBox(height: 14),
                Text('Пароль', style: AppTextStyle.caption_Regular),
                SizedBox(height: 4),
                AppPasswordTextform(
                  controller: _passwordController,
                  onChanged: (value) => setState(() {}),
                  validator: passwordValidate,
                ),
                SizedBox(height: 14),
                AppButton(
                  isActiveButton: _isActiveButton,
                  keyForm: _keyForm,
                  text: 'Далее',
                  onClick: PincodePage(),
                ),
                SizedBox(height: 15),
                InkWell(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Забыл пароль?',
                        style: AppTextStyle.text_Regular.copyWith(
                          color: AppColor.accent,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 59),
                SocialButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
