import 'package:ecommerce/auth/presentation/auth_view_model/auth_states.dart';
import 'package:ecommerce/auth/presentation/auth_view_model/auth_view_model.dart';
import 'package:ecommerce/auth/presentation/view/widgets/field_section.dart';
import 'package:ecommerce/core/networking/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:toastification/toastification.dart';

import '../../../core/app_assets.dart';
import '../../../core/app_colors.dart';
import '../../../core/app_fonts.dart';

class RegisterationScreen extends StatelessWidget {
  const RegisterationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthCubit authCubit = context.read<AuthCubit>();
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
            toastification.show(
              context: context,
              showProgressBar: true,
              type: ToastificationType.success,
              style: ToastificationStyle.fillColored,
              title: Text("Successful operation"),
              description: Text("Operation completed successfully."),
              autoCloseDuration: Duration(seconds: 3),
            );
            Navigator.pop(context);
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
              key: authCubit.formKey,
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
                  FieldSection(
                    title: "full name",
                    hintText: "enter your full name",
                    fieldController: authCubit.userNameController,
                  ),
                  SizedBox(height: size.height * .01),
                  FieldSection(
                    title: "mobile number",
                    hintText: "enter your phone number",
                    fieldController: authCubit.phoneNumController,
                  ),
                  SizedBox(height: size.height * .01),
                  FieldSection(
                    title: "E-mail address",
                    hintText: "enter your email",
                    fieldController: authCubit.emailController,
                  ),
                  SizedBox(height: size.height * .01),
                  FieldSection(
                    title: "password",
                    hintText: "enter your password",
                    fieldController: authCubit.passController,
                  ),

                  SizedBox(height: size.height * .06),
                  SizedBox(
                    height: 46.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        if (authCubit.formKey.currentState!.validate()) {
                          authCubit.userRegister();
                          // ScaffoldMessenger.of(context).showSnackBar(
                          //   const SnackBar(
                          //     content: Text('Form Submitted Successfully!'),
                          //   ),
                          // );
                        } else {
                          // ScaffoldMessenger.of(context).showSnackBar(
                          //   const SnackBar(
                          //     content: Text('Please fix the errors in red'),
                          //   ),
                          // );
                        }
                      },
                      child: Text(
                        "Sign up",
                        style: AppFonts.darkBlue20SemiBold,
                      ),
                    ),
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
