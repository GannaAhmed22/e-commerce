import 'package:ecommerce/core/networking/app_route.dart';
import 'package:ecommerce/core/theme_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppClient extends StatelessWidget {
  const AppClient({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: "E-commerce",
        debugShowCheckedModeBanner: false,
        theme: ThemeApp.themeApp,
    
  onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}
