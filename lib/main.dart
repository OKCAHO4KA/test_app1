import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:test_app1/config/theme/ui_themes.dart';
import 'package:test_app1/di/di.dart';
import 'package:test_app1/di/initial_biding.dart';
import 'package:test_app1/screens/home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  DependencyInjection.init();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitialBinding(),
      debugShowCheckedModeBanner: false,
      theme: UIThemes.lightTheme(),
      home: HomeScreen(),
    );
  }
}
