String? emailValidate(String? value) {
  if (value == null && value!.isEmpty) {
    return 'Пустая строка';
  }

  const String emailRegexp =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|'
      r'(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|'
      r'(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  final RegExp regExp = RegExp(emailRegexp);
  final res = regExp.hasMatch(value);
  if (!res) {
    return 'Не правильно введен Email';
  } else {
    return null;
  }
}

String? passwordValidate(String? value) {
  if (value == null && value!.isEmpty) {
    return 'Пустая строка';
  }

  if (value.length < 5) {
    return 'Пароль должен быть от 5 символов';
  } else {
    return null;
  }
}
