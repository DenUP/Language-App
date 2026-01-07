import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:language_app/core/theme/app_color.dart';
import 'package:language_app/core/theme/app_text_style.dart';
import 'package:language_app/features/auth/presentation/pages/add_profile_pages.dart';
import 'package:language_app/features/pincode/data/pincode_repository_impl.dart';
import 'package:language_app/features/pincode/domain/pincode_repository.dart';

class PincodePage extends StatefulWidget {
  const PincodePage({super.key});

  @override
  State<PincodePage> createState() => _PincodePageState();
}

class _PincodePageState extends State<PincodePage> {
  String _pincode = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 84),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    PincodeRepositoryImpl().delPincode();

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddProfilePages(),
                      ),
                    );
                  },
                  child: Text(
                    'Пропустить',
                    style: AppTextStyle.text_Regular.copyWith(
                      color: AppColor.accent,
                    ),
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
            style: AppTextStyle.text_Regular.copyWith(color: AppColor.caption),
          ),
          SizedBox(height: 56),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(4, (int index) {
              return Container(
                width: 16,
                height: 16,
                margin: EdgeInsets.only(right: 12),
                decoration: BoxDecoration(
                  color: _pincode.length > index
                      ? AppColor.accent
                      : Colors.transparent,
                  shape: BoxShape.circle,
                  border: BoxBorder.all(color: AppColor.accent, width: 1),
                ),
              );
            }),
          ),
          SizedBox(height: 60),
          for (var i = 0; i < 3; i++)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 43),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(3, (int index) {
                  final intButton = 1 + 3 * i + index;
                  return numButton(intButton);
                }),
              ),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 43),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(width: 80, height: 80, margin: EdgeInsets.all(12)),
                numButton(0),
                Container(
                  width: 80,
                  height: 80,
                  margin: EdgeInsets.all(12),

                  child: IconButton(
                    onPressed: () {
                      if (_pincode.isNotEmpty) {
                        setState(() {
                          _pincode = _pincode.substring(0, _pincode.length - 1);
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
    );
  }

  Container numButton(int intButton) {
    return Container(
      width: 80,
      height: 80,
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColor.input_bg,
        shape: BoxShape.circle,
      ),
      child: TextButton(
        onPressed: () {
          if (_pincode.length < 4) {
            setState(() {
              _pincode = _pincode + intButton.toString();
            });
          }
          if (_pincode.length == 4) {
            PincodeRepositoryImpl().addPincode(_pincode);

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddProfilePages()),
            );
          }
        },
        child: Text(
          intButton.toString(),
          style: AppTextStyle.title1_Semibold.copyWith(color: AppColor.black),
        ),
      ),
    );
  }
}
