import 'package:ecommerce/core/app_assets.dart';
import 'package:ecommerce/core/app_colors.dart';
import 'package:ecommerce/core/app_fonts.dart';
import 'package:ecommerce/auth/presentation/view/widgets/profile_form.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Image.asset(AppAssets.routeLogo)),
      body: Padding(
        padding: EdgeInsets.all(size.height * .0),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      "Welcome user's name",
                      style: AppFonts.darkBlue18Medium,
                    ),
                    SizedBox(height: size.height * 0.01),
                    Text("Welcome user's name", style: AppFonts.gray14Medium),
                    SizedBox(height: size.height * 0.06),
                  ],
                ),
                Spacer(),
                TextButton(
                  onPressed: () {
                    // save logic
                  },

                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.darkBlue,
                    textStyle: AppFonts.darkBlue14Medium.copyWith(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  child: const Text('Save'),
                ),
              ],
            ),
            ProfileForm(),
          ],
        ),
      ),
    );
  }
}
