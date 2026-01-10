import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:language_app/features/auth/presentation/pages/new_password.dart';
import 'package:ui_kit/app_text_style.dart';
import 'package:ui_kit/ui_kit.dart';

class OtpTelegram extends StatefulWidget {
  const OtpTelegram({super.key});

  @override
  State<OtpTelegram> createState() => _OtpTelegramState();
}

class _OtpTelegramState extends State<OtpTelegram> {
  final controllers = List.generate(4, (_) => TextEditingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Введите код из Telegram',
              style: AppTextStyle.title3_Semibold.copyWith(
                color: AppColor.black,
              ),
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (int index) {
                return Container(
                  width: 48,
                  height: 48,
                  margin: EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                    color: AppColor.input_bg,
                    border: Border.all(color: AppColor.input_stroke, width: 1),
                  ),
                  child: TextFormField(
                    controller: controllers[index],
                    onChanged: (value) {
                      if (controllers[index].text.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                      final notEmpty = controllers.every(
                        (e) => e.text.isNotEmpty,
                      );
                      if (notEmpty) {
                        final res = controllers.map((e) => e.text).toList();
                        print(res);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NewPassword(),
                          ),
                        );
                      }
                    },
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                );
              }),
            ),
            SizedBox(height: 15),
            Text(
              'Отправить код повторно можно\nбудет через 55 секунд',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
