import 'package:ecommerce/layout/home/presentation/view_model/category_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/app_colors.dart';
import '../../../../../models/category_model.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    final viewModel = context.read<CategoryViewCubit>();

    return GridView.builder(
      padding: EdgeInsets.zero,
      scrollDirection: Axis.horizontal,

      itemCount: viewModel.categories.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 2,
        childAspectRatio: 3 / 5,
      ),
      itemBuilder: (context, index) => Column(
        children: [
           Expanded(
              child: SizedBox(
      width: 80,  // circle diameter
      height: 80,
      child: ClipOval(
        child: Image.network(
          viewModel.getCategory(index).image,
          fit: BoxFit.fill,  
          errorBuilder: (context, error, stackTrace) =>
              const Icon(Icons.broken_image),
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
              ),
            ),
          Text(
            viewModel.getCategory(index).name,
            style: theme.labelSmall!.copyWith(color: AppColors.primaryColor),
          ),
        ],
      ),
    );
  }
}
