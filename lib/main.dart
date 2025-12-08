import 'package:ecommerce/auth/domain/usecases/login_usecase.dart';
import 'package:ecommerce/auth/presentation/auth_view_model/auth_view_model.dart';
import 'package:ecommerce/auth/presentation/view/registration_screen.dart';
import 'package:ecommerce/core/theme_app.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth/domain/usecases/register_usecase.dart';
import 'core/di/di_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await setupDependencies();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "E-commerce",
      debugShowCheckedModeBanner: false,
      theme: ThemeApp.themeApp,
      home: BlocProvider(
          create: (_) => getIt.get<AuthCubit>(),
          child: RegisterScreen(),
        ),
    );
  }
}
