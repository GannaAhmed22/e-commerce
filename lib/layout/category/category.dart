import 'package:ecommerce/layout/category/category_products.dart';
import 'package:flutter/material.dart';

import '../../core/app_colors.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    bool flag = true;
    return flag==false?Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border(
                  top: BorderSide(color: AppColors.lightBlueColor),
                  left: BorderSide(color: AppColors.lightBlueColor),
                  bottom: BorderSide(color: AppColors.lightBlueColor),
                ),
                color: AppColors.lightBlueColor.withOpacity(0.3),
              ),
              child: ListView.builder(
                itemCount: 7,
                itemBuilder: (context, index) {
                  return
                      Container(
                        width: double.infinity,
                        height: 80,
                        padding: EdgeInsets.symmetric(vertical: 2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),

                          color: (index==0)?AppColors.whiteColor:Colors.transparent,

                        ),
                        margin: EdgeInsets.all(2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,

                          children: [
                            Container(decoration:BoxDecoration(color: AppColors.primaryColor,borderRadius: BorderRadius.circular(3)),height: 80,width: 10,),
                            Text(
                              "Men's fashion",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                  );
                },
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
                right: 8.0,
                bottom: 8.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    "Men's Fashion",
                    style: theme.headlineSmall!.copyWith(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    height: 120,
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 6, vertical: 16),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/13.png"),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        right: 16.0,
                        left: 16,
                        top: 8,
                        bottom: 16,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Men's\nfashion",
                            style: theme.labelLarge!.copyWith(
                              color: AppColors.primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text(
                                "Shop Now",
                                style: theme.labelMedium!.copyWith(
                                  color: AppColors.whiteColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.6,
                      ),
                      itemCount: 10,
                      itemBuilder: (_, index) => Column(
                        children: [
                          Container(
                            height: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.yellow,
                              border: Border.all(color: AppColors.primaryColor),
                            ),
                          ),
                          Text(
                            "Jeans",
                            style: theme.labelMedium!.copyWith(
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ):Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0,vertical: 12),
      child: CategoryProducts(),
    );
  }
}
