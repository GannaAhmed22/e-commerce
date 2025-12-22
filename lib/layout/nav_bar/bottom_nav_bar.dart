import 'package:ecommerce/core/app_assets.dart';
import 'package:ecommerce/core/app_colors.dart';
import 'package:ecommerce/layout/category/category.dart';
import 'package:ecommerce/layout/nav_bar/widgets/selected_icon.dart';
import 'package:ecommerce/auth/presentation/view/user_profile.dart';
import 'package:flutter/material.dart';

import '../home/home.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int screenIndex = 0;
  static const List<Widget> _tabs = [Home(), Category(), Home(), UserProfile()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Image.asset(AppAssets.routeLogo)),
      bottomNavigationBar: Container(
        
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(26),
            topRight: Radius.circular(26),
            
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            onTap: (index) => {screenIndex = index, setState(() {})},
            currentIndex: screenIndex,
            selectedItemColor: AppColors.primaryColor,
            unselectedItemColor: AppColors.whiteColor,
            backgroundColor: AppColors.primaryColor,

            items: [
              BottomNavigationBarItem(
                label: "",
                icon: SelectedIcon(
                  currentIndex: screenIndex,
                  iconPath: AppAssets.homeIcon,
                  iconIndex: 0,
                ),
              ),

              BottomNavigationBarItem(
                label: "",

                icon: SelectedIcon(
                  currentIndex: screenIndex,
                  iconPath: AppAssets.categoryIcon,
                  iconIndex: 1,
                ),
              ),
              BottomNavigationBarItem(
                label: "",

                icon: SelectedIcon(
                  currentIndex: screenIndex,
                  iconPath: AppAssets.favIcon,
                  iconIndex: 2,
                ),
              ),
              BottomNavigationBarItem(
                label: "",

                icon: SelectedIcon(
                  currentIndex: screenIndex,
                  iconPath: AppAssets.profile,
                  iconIndex: 3,
                ),
              ),
            ],
          ),
        ),
      ),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 8,
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: ImageIcon(AssetImage(AppAssets.searchIcon),color: AppColors.primaryColor,),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide(
                          color: AppColors.primaryColor,
                          width: 1,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide(
                          color: AppColors.primaryColor,
                          width: 1,
                        ),
                      ),
                      hintText: "What do you search for?",
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ImageIcon(AssetImage(AppAssets.shoppingCartIcon),color: AppColors.primaryColor,),
                ),
              ],
            ),
            Expanded(child:  _tabs[screenIndex])
          ],
        ),
      ),
    );
  }
}
