import 'package:ecommerce/core/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_fonts.dart';

class FieldSection extends StatefulWidget {
  const FieldSection({
    super.key,
    required this.title,
    required this.hintText,
    this.isPassword = false, required this.fieldController,this.validator,
  });

  final String title;
  final String hintText;
  final bool isPassword;
  final TextEditingController fieldController;
  final String? Function(String?)? validator;

  @override
  State<FieldSection> createState() => _FieldSectionState();
}

class _FieldSectionState extends State<FieldSection> {
  bool _obscureText = true; // 👈 Controls password visibility

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          widget.title,
          style: AppFonts.generalText(color: AppColors.whiteColor),
        ),
        SizedBox(height: size.height * 0.01),
        TextFormField(
          maxLines: 1,
          validator: widget.validator, // 👈 Use the passed validator here
          controller:widget.fieldController ,
          obscureText: widget.isPassword ? _obscureText : false,
          decoration: InputDecoration(
            hintText: widget.hintText,
            filled: true,
            fillColor: AppColors.whiteColor,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.whiteColor),
              borderRadius: BorderRadius.circular(16),
            ),
            suffixIcon: widget.isPassword
                ? IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            )
                : null,
          ),
        ),
      ],
    );
  }
}
