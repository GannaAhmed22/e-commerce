import 'package:ecommerce/auth/presentation/auth_view_model/auth_view_model.dart';
import 'package:ecommerce/auth/presentation/view/login_screen.dart';
import 'package:ecommerce/auth/presentation/view/registration_screen.dart';
import 'package:ecommerce/core/app_fonts.dart';
import 'package:ecommerce/core/di/di_manager.dart';
import 'package:ecommerce/core/networking/routes.dart';
import 'package:ecommerce/layout/category/category.dart';
import 'package:ecommerce/layout/home/presentation/view/home.dart';
import 'package:ecommerce/layout/home/presentation/view_model/category_view_model.dart';
import 'package:ecommerce/layout/nav_bar/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<AuthCubit>(
            create: (_) => getIt<AuthCubit>(),
            child: const LoginScreen(),
          ),
        );

      case Routes.registeration:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<AuthCubit>(
            create: (_) => getIt<AuthCubit>(),
            child: const RegisterationScreen(),
          ),
        );
      case Routes.layout:
        return MaterialPageRoute(builder:(_)=>BottomNavBar());
      case Routes.categories:
        return MaterialPageRoute(builder:(_)=>Category());  
      case Routes.fav:
        return MaterialPageRoute(builder:(_)=>Category());  
         
      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: getIt<CategoryViewCubit>(),
            child: const Home(),
          ),
        );
      // builder: (_) => BlocProvider<CategoryViewCubit>(
      //   create: (_) => getIt<CategoryViewCubit>(),
      //   child: const Home(),
      // ),
      // );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text("Not Found", style: AppFonts.white20SemiBold),
            ),
          ),
        );
    }
  }
}
