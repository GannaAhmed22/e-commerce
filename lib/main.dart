import 'package:device_preview/device_preview.dart';
import 'package:ecommerce/auth/view/registration_screen.dart';
import 'package:ecommerce/core/theme_app.dart';
import 'package:ecommerce/layout/nav_bar/bottom_nav_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => MyApp(),
  ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "E-commerce",
      
        
      debugShowCheckedModeBanner: false,
      theme: ThemeApp.themeApp,
      home:RegistrationScreen(),
      
    );
  }
}
