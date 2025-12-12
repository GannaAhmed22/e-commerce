import 'package:ecommerce/auth/presentation/auth_view_model/auth_states.dart';
import 'package:ecommerce/auth/presentation/view/widgets/field_section.dart';
import 'package:ecommerce/core/app_assets.dart';
import 'package:ecommerce/core/app_colors.dart';
import 'package:ecommerce/core/app_fonts.dart';
import 'package:ecommerce/core/networking/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toastification/toastification.dart';

import '../auth_view_model/auth_view_model.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<AuthCubit>();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.primaryColor,

      body: BlocListener<AuthCubit, AuthStates>(
        listener: (BuildContext context, state) {
          if (state is! LoadingAuthState && Navigator.canPop(context)) {
            Navigator.of(context).pop();
          }
          if (state is LoadingAuthState) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return const Center(child: CircularProgressIndicator());
              },
            );
          }
          if (state is ErrorAuthState) {
            toastification.show(
              context: context,
              type: ToastificationType.error,
              style: ToastificationStyle.fillColored,
              title: Text("Error"),
              showProgressBar: true,
              description: Text(state.errorMsg),
              autoCloseDuration: Duration(seconds: 4),
            );
          }
          if (state is SuccessAuthState) {
            // Navigator.of(context, rootNavigator: true).pop();
            toastification.show(
              context: context,
              showProgressBar: true,
              type: ToastificationType.success,
              style: ToastificationStyle.fillColored,
              title: Text("Successful operation"),
              description: Text("Operation completed successfully."),
              autoCloseDuration: Duration(seconds: 3),
            );
            Navigator.pushReplacementNamed(context, Routes.home);
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: size.width * 0.03,
              right: size.width * 0.03,
              top: size.height * 0.12,
              bottom: size.height * 0.09,
            ),
            child: Form(
              key: authCubit.loginFormKey,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    AppAssets.routeInit,
                    width: size.width * 0.05,
                    height: size.height * 0.1,
                  ),
                  SizedBox(height: size.height * .02),
                  Text(
                    "Welcome Back To Route",
                    style: AppFonts.white24SemiBold,
                  ),
                  SizedBox(height: size.height * .01),
                  Text(
                    "Please sign in with your mail",
                    style: AppFonts.white16Light,
                  ),
                  SizedBox(height: size.height * .01),
                  FieldSection(
                    title: "user name",
                    hintText: "enter your name",
                    fieldController: authCubit.userNameLoginController,
                  ),
                  SizedBox(height: size.height * .01),
                  FieldSection(
                    title: "password",
                    hintText: "enter your password",
                    fieldController: authCubit.passLoginController,
                  ),
                  SizedBox(height: size.height * .01),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "forget password",
                      style: AppFonts.white18Regular,
                    ),
                  ),
                  SizedBox(height: size.height * .02),
                  SizedBox(
                    height: 46.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        if (authCubit.loginFormKey.currentState!.validate()) {
                          authCubit.userLogin();
                          // ScaffoldMessenger.of(context).showSnackBar(
                          //   const SnackBar(
                          //     content: Text('Form Submitted Successfully!'),
                          //   ),
                          // );
                        } else {
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //     const SnackBar(
                        //       content: Text('Please fix the errors in red'),
                        //     ),
                        //   );
                        }
                      },
                      child: Text("Login", style: AppFonts.darkBlue20SemiBold),
                    ),
                  ),
                  SizedBox(height: size.height * .02),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: AppFonts.white14Medium,
                      ),
                      TextButton(
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.registeration);
                        },
                        child: Text(
                          " Create account",
                          style: AppFonts.white14Medium,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
