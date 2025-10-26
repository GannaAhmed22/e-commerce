import 'package:ecommerce/auth/view/widgets/field_section.dart';
import 'package:flutter/material.dart';

import '../../core/app_assets.dart';
import '../../core/app_colors.dart';
import '../../core/app_fonts.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
          key: _formKey,
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
              FieldSection(title: "full name", hintText: "enter your full name", fieldController: userNameController,),
              SizedBox(height: size.height * .01),
              FieldSection(title: "mobile number", hintText: "enter your phone number", fieldController: passController,),
              SizedBox(height: size.height * .01),
              FieldSection(title: "E-mail address", hintText: "enter your email", fieldController: passController,),
              SizedBox(height: size.height * .01),
              FieldSection(title: "password", hintText: "enter your password", fieldController: passController,),

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
                    if (_formKey.currentState!.validate()) {
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
                    "Sign up",
                    style: AppFonts.button(color: AppColors.primaryColor),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
