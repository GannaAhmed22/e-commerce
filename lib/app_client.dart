import 'package:ecommerce/auth/presentation/auth_view_model/auth_view_model.dart';
import 'package:ecommerce/auth/presentation/view/login_screen.dart';
import 'package:ecommerce/auth/presentation/view/registration_screen.dart';
import 'package:ecommerce/core/di/di_manager.dart';
import 'package:ecommerce/core/networking/app_route.dart';
import 'package:ecommerce/core/theme_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

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
