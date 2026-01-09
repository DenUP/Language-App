import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:language_app/core/theme/app_color.dart';
import 'package:language_app/core/theme/app_text_style.dart';
import 'package:language_app/features/auth/presentation/pages/new_password.dart';

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
                    border: BoxBorder.all(
                      color: AppColor.input_stroke,
                      width: 1,
                    ),
                  ),
                  child: TextFormField(
                    controller: controllers[index],
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                      bool isNotEmpty = controllers.every(
                        (e) => e.text.isNotEmpty,
                      );
                      if (isNotEmpty) {
                        final opt = controllers.map((e) => e.text).toList();
                        print(opt);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NewPassword(),
                          ),
                        );
                      }
                    },
                    textAlign: TextAlign.center,
                    style: AppTextStyle.title2_Regular.copyWith(
                      color: AppColor.black,
                    ),
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                );
              }),
            ),
            SizedBox(height: 16),
            Text(
              textAlign: TextAlign.center,
              'Отправить код повторно можно\nбудет через 55 секунд',
              style: AppTextStyle.text_Regular.copyWith(
                color: AppColor.caption,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
