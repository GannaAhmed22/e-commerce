import 'package:ecommerce/core/app_colors.dart';
import 'package:flutter/material.dart';


class SelectedIcon extends StatelessWidget {
  final String iconPath;
  final int iconIndex;
  final int currentIndex;

  const SelectedIcon({
    super.key,
    required this.iconPath,
    required this.iconIndex,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return currentIndex == iconIndex
        ? Container(
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: ImageIcon(AssetImage(iconPath),size: size.width * 0.08,),
          )
        : ImageIcon(AssetImage(iconPath),size: size.width * 0.08);
  }
}