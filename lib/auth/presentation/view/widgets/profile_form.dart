import 'package:ecommerce/auth/presentation/auth_view_model/auth_view_model.dart';
import 'package:ecommerce/auth/presentation/view/widgets/field_section.dart';
import 'package:ecommerce/core/app_colors.dart';
import 'package:ecommerce/core/app_fonts.dart';
import 'package:ecommerce/core/app_validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileForm extends StatelessWidget {
  const ProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<AuthCubit>();

    return Form(
      key: authCubit.profileFormKey,
      child: Column(
          children: [
            FieldSection(
              fieldController: authCubit.profileNameController,
              hintText: "",
              title: "Your full name",
              isProfile: true,
              suffixIconWidget: Icon(
                Icons.border_color_outlined,
                color: AppColors.darkBlue,
              ),
              textStyle: AppFonts.darkBlue18Medium,
              titleStyle: AppFonts.darkBlue14Medium,
              validator: (value)=>AppValidation.validateUsername(value),
            ),
             FieldSection(
              fieldController: authCubit.profileEmailController,
              hintText: "",
              title: "Your E-mail",
              isProfile: true,
              suffixIconWidget: Icon(
                Icons.border_color_outlined,
                color: AppColors.darkBlue,
              ),
              textStyle: AppFonts.darkBlue18Medium,
              titleStyle: AppFonts.darkBlue14Medium,
              validator: (value)=>AppValidation.validateEmail(value),
            ),
             FieldSection(
              fieldController: authCubit.profilePassController,
              hintText: "",
              title: "Your Password",
              isProfile: true,
              suffixIconWidget: Icon(
                Icons.border_color_outlined,
                color: AppColors.darkBlue,
              ),
              textStyle: AppFonts.darkBlue18Medium,
              titleStyle: AppFonts.darkBlue14Medium,
              validator: (value)=>AppValidation.validatePassword(value),
            ),
             FieldSection(
              fieldController: authCubit.profilePhoneController,
              hintText: "",
              title: "Your mobile number",
              isProfile: true,
              suffixIconWidget: Icon(
                Icons.border_color_outlined,
                color: AppColors.darkBlue,
              ),
              textStyle: AppFonts.darkBlue18Medium,
              titleStyle: AppFonts.darkBlue14Medium,
              validator: (value)=>AppValidation.validateEgyptianNumber(value),
            ),
             FieldSection(
              fieldController: authCubit.profileAddressController,
              hintText: "",
              title: "Your address",
              isProfile: true,
              suffixIconWidget: Icon(
                Icons.border_color_outlined,
                color: AppColors.darkBlue,
              ),
              textStyle: AppFonts.darkBlue18Medium,
              titleStyle: AppFonts.darkBlue14Medium,
            ),
          ],
        ),
    );
  }
}