import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:language_app/features/auth/presentation/pages/add_profile.dart';
import 'package:ui_kit/app_text_style.dart';
import 'package:ui_kit/ui_kit.dart';

class Pincode extends StatefulWidget {
  const Pincode({super.key});

  @override
  State<Pincode> createState() => _PincodeState();
}

class _PincodeState extends State<Pincode> {
  String _pincode = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 84),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Пропустить',
                    style: AppTextStyle.text_Regular.copyWith(
                      color: AppColor.accent,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            Text(
              'Создайте пароль',
              style: AppTextStyle.title1_Heavy.copyWith(color: AppColor.black),
            ),
            SizedBox(height: 16),
            Text(
              'Для защиты ваших персональных данных',
              style: AppTextStyle.text_Regular.copyWith(
                color: AppColor.caption,
              ),
            ),
            SizedBox(height: 56),
            // Row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (int index) {
                return Container(
                  width: 16,
                  height: 16,
                  margin: EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColor.accent, width: 1),
                    shape: BoxShape.circle,
                    color: _pincode.length > index
                        ? AppColor.accent
                        : Colors.transparent,
                  ),
                );
              }),
            ),
            SizedBox(height: 60),
            for (int i = 0; i < 3; i++)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(3, (int index) {
                    final intbutton = 1 + 3 * i + index;
                    return _buttonWidget(intbutton);
                  }),
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(width: 80, height: 80, margin: EdgeInsets.all(12)),
                  _buttonWidget(0),
                  Container(
                    width: 80,
                    height: 80,
                    margin: EdgeInsets.all(12),
                    child: IconButton(
                      onPressed: () {
                        if (_pincode.isNotEmpty) {
                          setState(() {
                            _pincode = _pincode.substring(
                              0,
                              _pincode.length - 1,
                            );
                          });
                        }
                      },
                      icon: SvgPicture.asset('assets/icons/del.svg'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _buttonWidget(int intbutton) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: AppColor.input_bg,
        shape: BoxShape.circle,
      ),
      margin: EdgeInsets.all(12),
      child: TextButton(
        onPressed: () {
          if (_pincode.length < 4) {
            setState(() {
              _pincode = _pincode + intbutton.toString();
            });
          }
          if (_pincode.length == 4) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => AddProfile()),
            );
          }
        },
        child: Text(
          intbutton.toString(),
          style: AppTextStyle.title1_Semibold.copyWith(color: AppColor.black),
        ),
      ),
    );
  }
}
