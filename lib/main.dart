import 'package:flutter/material.dart';
import 'package:language_app/features/auth/presentation/pages/auth_pages.dart';
import 'package:language_app/features/main/presentatiton/pages/main_pages.dart';
import 'package:language_app/getit.dart';
import 'package:ui_kit/ui_kit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUp();

  // final pb = ;
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPages(),
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
