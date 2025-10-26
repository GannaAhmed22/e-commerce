import 'package:ecommerce/core/app_assets.dart';
import 'package:ecommerce/core/app_colors.dart';
import 'package:ecommerce/layout/category/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  int selectedIndexColor = -1;
  int selectedIndexSize = -1;
  static const List<String> _sizes = ['20', '25', '30', '45'];
  static const List<String> _colors = ['red', 'blue', 'purple', 'green'];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;

    return CustomAppBar(
      screenWidget: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 300,
                child: Stack(
                  children: [
                    // page view
                    PageView.builder(
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                      itemBuilder: (_, index) => Container(
                        height: 200,
                        margin: EdgeInsets.symmetric(horizontal: 6),
                        decoration: BoxDecoration(
                          // color: Colors.yellow,
                          border: Border.all(color: AppColors.lightBlueColor),
                          image: DecorationImage(
                            image: AssetImage("assets/images/11.png"),
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      itemCount: 3,
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: ImageIcon(
                            AssetImage(AppAssets.favIcon),
                            color: AppColors.primaryColor,
                            size: 35,
                          ),
                        ),
                      ),
                    ),
                    // smooth indicators
                    Positioned(
                      top: 280,
                      left: 160,

                      child: Row(
                        children: List.generate(
                          3,
                          (index) => Container(
                            height: 5,
                            width: index == _currentIndex ? 20 : 5,
                            margin: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              color: index == _currentIndex
                                  ? AppColors.primaryColor
                                  : AppColors.whiteColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "EGP 1,2000",
                    style: theme.labelLarge!.copyWith(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "EGP 1,2000",
                    style: theme.labelLarge!.copyWith(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: AppColors.lightBlueColor),
                    ),
                    child: Text(
                      "1,2000 sold",
                      style: theme.labelLarge!.copyWith(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Icon(Icons.star, color: Colors.yellow),
                  Text(
                    "4.8(1,799)",
                    style: theme.labelLarge!.copyWith(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: AppColors.lightBlueColor),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.remove_circle_outline_outlined,
                            color: AppColors.whiteColor,
                          ),
                        ),
                        Text(
                          "1",
                          style: theme.labelLarge!.copyWith(
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.add_circle_outline,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Text(
                "Description",
                style: theme.titleLarge!.copyWith(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ReadMoreText(
                "This is a very long product description that you want to show partially. "
                "When the user taps 'Read more', the full text will appear.",
                trimLines: 2,
                colorClickableText: AppColors.primaryColor,
                trimMode: TrimMode.Line,
                trimCollapsedText: " Read more",
                trimExpandedText: " Read less",

                style: TextStyle(color: AppColors.lightBlueColor, fontSize: 16),
              ),
              Text(
                "Size",
                style: theme.titleLarge!.copyWith(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: List.generate(
                  _sizes.length,
                  (index) => InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndexSize = index;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(16),
                      padding: EdgeInsets.all(8),

                      decoration: BoxDecoration(
                        color: index == selectedIndexSize
                            ? AppColors.primaryColor
                            : AppColors.whiteColor,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        _sizes[index],
                        style: theme.bodyLarge!.copyWith(
                          color: index == selectedIndexSize
                              ? AppColors.whiteColor
                              : AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                "Size",
                style: theme.titleLarge!.copyWith(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: List.generate(
                  _sizes.length,
                  (index) => InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndexSize = index;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(16),
                      padding: EdgeInsets.all(8),

                      decoration: BoxDecoration(
                        color: index == selectedIndexSize
                            ? AppColors.primaryColor
                            : AppColors.whiteColor,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        _sizes[index],
                        style: theme.bodyLarge!.copyWith(
                          color: index == selectedIndexSize
                              ? AppColors.whiteColor
                              : AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        "Description",
                        style: theme.titleLarge!.copyWith(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Description",
                        style: theme.titleLarge!.copyWith(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  
                ],
              ),
            ],
          ),
        ),
      ),
      title: "Product Details",
    );
  }
}
