import 'package:flutter/material.dart';

import '../../../core/app_colors.dart';
import '../../../models/category_model.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key,});
  static final List<CategoryModel> _categories = [
    CategoryModel(title: "Women's fashion", imgPath: "assets/images/13.png"),
    CategoryModel(title: "men's fashion", imgPath: "assets/images/13.png"),
    CategoryModel(title: "Baby toys", imgPath: "assets/images/13.png"),
    CategoryModel(title: "Headphones", imgPath: "assets/images/13.png"),
    CategoryModel(title: "Laptops & Electrics", imgPath: "assets/images/13.png"),
    CategoryModel(title: "Beauty", imgPath: "assets/images/13.png"),
    CategoryModel(title: "SkinCare", imgPath: "assets/images/13.png"),
    CategoryModel(title: "Cameras", imgPath: "assets/images/13.png"),
  ];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;

    return GridView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,

        itemCount: _categories.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 2,
            childAspectRatio: 3/5
        ),
        itemBuilder: (context, index) =>Column(
          children: [
            CircleAvatar(backgroundImage: AssetImage(_categories[index].imgPath),),
            Text(
            _categories[index].title,
            style: theme.labelSmall!.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
    ],
        )
    );
  }
}
