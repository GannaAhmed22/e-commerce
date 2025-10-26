import 'package:ecommerce/auth/view/widgets/field_section.dart';
import 'package:ecommerce/core/app_assets.dart';
import 'package:ecommerce/core/app_colors.dart';
import 'package:ecommerce/core/app_fonts.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({super.key});
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Padding(
        padding: EdgeInsets.only(
          left: size.width * 0.03,
          right: size.width * 0.03,
          top: size.height * 0.12,
          bottom: size.height * 0.09,
        ),
        child: Form(
          key: _loginFormKey,
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
              FieldSection(title: "user name", hintText: "enter your name", fieldController: userNameController,),
              SizedBox(height: size.height * .01),
              FieldSection(title: "password", hintText: "enter your password", fieldController: passController,),
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
                    if (_loginFormKey.currentState!.validate()) {
                      // Example: send data to API or navigate
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Form Submitted Successfully!')),
                      );
                    } else {
                      // 👇 One or more fields are invalid
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Please fix the errors in red')),
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
                    onPressed: () {

                    },
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
    );
  }
}
