import 'package:ecommerce/auth/presentation/auth_view_model/auth_states.dart';
import 'package:ecommerce/auth/presentation/view/widgets/field_section.dart';
import 'package:ecommerce/core/app_assets.dart';
import 'package:ecommerce/core/app_colors.dart';
import 'package:ecommerce/core/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../auth_view_model/auth_view_model.dart';

class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<AuthCubit>();

    final size = MediaQuery.of(context).size;
    final text = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: BlocListener<AuthCubit, AuthStates>(
        listener: (BuildContext context, state) {
          if (state is LoadingAuthState) {
            showDialog(
              context: context,
              builder: (context) {
                return const Center(child: CircularProgressIndicator());
              },
            );
          }
          if (state is ErrorAuthState) {
            showDialog(
              context: context,
              builder: (context) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Lottie.asset('assets/animate_icon/Failed.json'),
                    Text(state.errorMsg,style: text.titleLarge!.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.darkBlue
                    ),)
                  ],
                );
              },
            );
          }
          if (state is SuccessAuthState) {
            showDialog(
              context: context,
              builder: (context) {
                return Lottie.asset('assets/animate_icon/Success.json');
              },
            );
          }
        },
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
                  style: AppFonts.header1(color: AppColors.whiteColor),
                ),
                SizedBox(height: size.height * .01),
                Text(
                  "Please sign in with your mail",
                  style: AppFonts.smallText(color: AppColors.whiteColor),
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
                    style: AppFonts.smallText(color: AppColors.whiteColor),
                  ),
                ),
                SizedBox(height: size.height * .02),
                SizedBox(
                  height: size.height * .056,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      if (authCubit.loginFormKey.currentState!.validate()) {
                        authCubit.userLogin();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Form Submitted Successfully!'),
                          ),
                        );
                      } else {
                        // 👇 One or more fields are invalid
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please fix the errors in red'),
                          ),
                        );
                      }
                    },
                    child: Text(
                      "Login",
                      style: AppFonts.button(color: AppColors.primaryColor),
                    ),
                  ),
                ),
                SizedBox(height: size.height * .02),

                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // center horizontally
                  children: [
                    Text(
                      "Don't have an account?",
                      style: AppFonts.smallText(color: AppColors.whiteColor),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        // minimumSize: Size(0, 0),
                        // tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      onPressed: () {},
                      child: Text(
                        " Create account",
                        style: AppFonts.smallText(color: AppColors.whiteColor),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
