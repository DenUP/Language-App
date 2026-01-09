import 'package:flutter/material.dart';
import 'package:language_app/core/theme/app_color.dart';
import 'package:language_app/features/auth/presentation/pages/auth_pages.dart';

Future<void> main() async {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AuthPages(),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'SF-Pro',
        scaffoldBackgroundColor: AppColor.black,
        colorSchemeSeed: AppColor.accent,
      ),
      theme: ThemeData(
        brightness: Brightness.light,
        fontFamily: 'SF-Pro',
        scaffoldBackgroundColor: AppColor.white,
        colorSchemeSeed: AppColor.accent,
      ),
    );
  }
}
