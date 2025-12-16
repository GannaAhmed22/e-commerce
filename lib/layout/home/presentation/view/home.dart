import 'package:ecommerce/core/app_colors.dart';
import 'package:ecommerce/layout/home/presentation/view/widgets/banner_view.dart';
import 'package:ecommerce/layout/home/presentation/view/widgets/card_view.dart';
import 'package:ecommerce/layout/home/presentation/view/widgets/category_list.dart';
import 'package:ecommerce/layout/home/presentation/view_model/category_view_model.dart';
import 'package:ecommerce/layout/home/presentation/view_model/category_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final CategoryViewCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<CategoryViewCubit>();
    cubit.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 200, child: BannerView()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Categories",
                      style: theme.headlineSmall!.copyWith(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "presentation all",
                        style: theme.labelLarge!.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 150,
                  child: BlocBuilder<CategoryViewCubit, CategoryViewState>(
                    builder: (context, state) {
                      if (state is LoadingitemsState) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primaryColor,
                          ),
                        );
                      } else {
                        return CategoryList();
                      }
                    },
                  ),
                ),
                Text(
                  "Home Appliance",
                  style: theme.headlineSmall!.copyWith(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 230,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => CardView(),
                    separatorBuilder: (context, index) => SizedBox(width: 20),
                    itemCount: 10,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
