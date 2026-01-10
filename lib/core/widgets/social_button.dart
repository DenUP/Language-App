import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:ui_kit/ui_kit.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Или войдите с помощью',
              style: AppTextStyle.text_Regular.copyWith(
                color: AppColor.caption,
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        SizedBox(
          height: 60,
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shadowColor: Colors.transparent,
              backgroundColor: AppColor.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(12),
              ),
              side: BorderSide(color: AppColor.input_stroke, width: 1),
            ),
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/icons/vk.svg'),
                SizedBox(width: 16),
                Text(
                  'Войти с VK',
                  style: AppTextStyle.title3_Medium.copyWith(
                    color: AppColor.black,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 16),
        SizedBox(
          height: 60,
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shadowColor: Colors.transparent,
              backgroundColor: AppColor.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(12),
              ),
              side: BorderSide(color: AppColor.input_stroke, width: 1),
            ),
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/icons/yandex.svg'),
                SizedBox(width: 16),
                Text(
                  'Войти с Yandex',
                  style: AppTextStyle.title3_Medium.copyWith(
                    color: AppColor.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
