import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/colors.dart';
import 'package:whatsapp_clone/screens/mobile_layout_screen.dart';
import 'package:whatsapp_clone/utils/responsive.dart';
import 'screens/desktop_layout_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
          fontFamily: 'Helvetica',
          brightness: Brightness.light,
          scaffoldBackgroundColor: backgroundColorLightTheme),
      darkTheme: ThemeData(
          fontFamily: 'Helvetica',
          brightness: Brightness.dark,
          scaffoldBackgroundColor: backgroundColorDarkTheme,
          appBarTheme: const AppBarTheme(backgroundColor: appBarColor)),
      home: const ResponsiveLayout(
          mobile: MobileLayoutScreen(), desktop: DesktopLayoutScreen()),
    );
  }
}
