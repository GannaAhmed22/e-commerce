import 'package:ecommerce/core/app_assets.dart';
import 'package:ecommerce/layout/category/product_details.dart';
import 'package:flutter/material.dart';

import '../../core/app_colors.dart';

class CategoryProducts extends StatelessWidget {
  const CategoryProducts({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 3,
        crossAxisSpacing: 5,
        childAspectRatio: 0.7,
      ),
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetails()));
            // Navigator.pushNamed(context, routeName);
          },
          child: Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: AppColors.lightBlueColor),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(8),
                        topLeft: Radius.circular(8),
                      ),
                      child: Image.asset(
                        "assets/images/13.png",
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: ImageIcon(
                            AssetImage(AppAssets.favIcon),
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Washing machine\nNike shoes flexible for work",
                    overflow: TextOverflow.ellipsis,
                    style: theme.labelLarge!.copyWith(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "EGP 1,2000",
                        style: theme.labelLarge!.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      ),
                      Text(
                        "1,2000",
                        style: theme.labelLarge!.copyWith(
                          color: AppColors.lightBlueColor,
                          decorationColor: AppColors.lightBlueColor,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Row(
                    children: [
                      Text(
                        "Review: (4.8)",
                        style: theme.labelLarge!.copyWith(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.star, color: Colors.yellow),
                      Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Icon(Icons.add, color: AppColors.whiteColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
