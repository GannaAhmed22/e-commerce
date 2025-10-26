import 'package:ecommerce/core/app_assets.dart';
import 'package:ecommerce/core/app_colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.screenWidget, required this.title});
  final Widget screenWidget;
  final String title;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back,color: AppColors.primaryColor,),
        centerTitle: true,
        title: Text(
          title,
          style: theme.titleLarge!.copyWith(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(onPressed: (){}, icon: ImageIcon(AssetImage(AppAssets.searchIcon),color: AppColors.primaryColor,)),
          IconButton(onPressed: (){}, icon: ImageIcon(AssetImage(AppAssets.shoppingCartIcon),color: AppColors.primaryColor,))
        ],
      ),
      body: screenWidget,
    );
  }
}
