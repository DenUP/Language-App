import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:language_app/core/theme/app_color.dart';
import 'package:language_app/core/theme/app_text_style.dart';
import 'package:language_app/core/widgets/app_button.dart';
import 'package:language_app/core/widgets/app_textformfield.dart';
import 'package:language_app/features/auth/presentation/pages/otp_telegram.dart';

class AddProfile extends StatefulWidget {
  const AddProfile({super.key});

  @override
  State<AddProfile> createState() => _AddProfileState();
}

class _AddProfileState extends State<AddProfile> {
  final _name = TextEditingController();
  final _otchestvo = TextEditingController();
  final _lastname = TextEditingController();
  final _date = TextEditingController();
  String? _pol;
  final _telegram = TextEditingController();
  final _key = GlobalKey<FormState>();

  bool get _isActiveButton =>
      _name.text.isNotEmpty &&
      _otchestvo.text.isNotEmpty &&
      _lastname.text.isNotEmpty &&
      _date.text.isNotEmpty &&
      _pol != null &&
      _telegram.text.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 76),
              Text(
                'Создание Профиля',
                style: AppTextStyle.title1_Heavy.copyWith(
                  color: AppColor.black,
                ),
              ),
              SizedBox(height: 44),
              Text(
                'Без профиля вы не сможете создавать проекты.',
                style: AppTextStyle.caption_Regular.copyWith(
                  color: AppColor.caption,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'В профиле будут храниться результаты проектов\nи ваши описания.',
                style: AppTextStyle.caption_Regular.copyWith(
                  color: AppColor.caption,
                ),
              ),
              SizedBox(height: 32),
              AppTextformfield(
                controller: _name,
                hintText: "Имя",
                onChanged: (value) {
                  setState(() {
                    value;
                  });
                },
                validator: null,
              ),
              SizedBox(height: 24),
              AppTextformfield(
                controller: _otchestvo,
                hintText: "Отчество",
                onChanged: (value) {
                  setState(() {
                    value;
                  });
                },
                validator: null,
              ),
              SizedBox(height: 24),
              AppTextformfield(
                controller: _lastname,
                hintText: "Фамилия",
                onChanged: (value) {
                  setState(() {
                    value;
                  });
                },
                validator: null,
              ),
              SizedBox(height: 24),
              AppTextformfield(
                controller: _date,
                hintText: "Дата рождения",
                onChanged: (value) {
                  setState(() {
                    value;
                  });
                },
                validator: null,
                isReady: true,
                onTap: () => _selectDate(),
              ),
              SizedBox(height: 24),
              DropdownButtonFormField(
                initialValue: _pol,
                items: [
                  DropdownMenuItem(child: Text('Мужской'), value: 'Мужской'),
                  DropdownMenuItem(child: Text('Женский'), value: 'Женский'),
                ],
                onChanged: (value) {
                  setState(() {
                    _pol = value;
                  });
                },
                style: AppTextStyle.text_Regular.copyWith(
                  color: AppColor.black,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColor.input_bg,
                  hintText: 'Пол',
                  hintStyle: AppTextStyle.text_Regular.copyWith(
                    color: AppColor.input_icon,
                  ),
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
              ),

              SizedBox(height: 24),
              AppTextformfield(
                controller: _telegram,
                hintText: "Telegram",
                onChanged: (value) {
                  setState(() {
                    value;
                  });
                },
                validator: null,
              ),
              SizedBox(height: 68),
              AppButton(
                isActiveButton: _isActiveButton,
                keyForm: _key,
                text: "Создать",
                onClick: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OtpTelegram()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2000, 7, 25),
      firstDate: DateTime(1900),
      lastDate: DateTime(2025),
    );

    setState(() {
      if (pickedDate != null) {
        _date.text = DateFormat('d MMMM y').format(pickedDate);
      }
    });
  }
}
