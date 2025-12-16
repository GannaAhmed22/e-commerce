import 'package:ecommerce/auth/presentation/auth_view_model/auth_view_model.dart';
import 'package:ecommerce/auth/presentation/view/login_screen.dart';
import 'package:ecommerce/auth/presentation/view/registration_screen.dart';
import 'package:ecommerce/core/app_fonts.dart';
import 'package:ecommerce/core/di/di_manager.dart';
import 'package:ecommerce/core/networking/routes.dart';
import 'package:ecommerce/layout/home/home.dart';
import 'package:ecommerce/auth/presentation/view/user_profile.dart';
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
      case Routes.profile:
       return MaterialPageRoute(
          builder: (_) => UserProfile()
          
        );
      case Routes.home:
        return MaterialPageRoute(builder: (context) => Home());
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
