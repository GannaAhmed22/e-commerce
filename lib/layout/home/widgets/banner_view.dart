import 'package:flutter/material.dart';

import '../../../core/app_colors.dart';

class BannerView extends StatefulWidget {
  const BannerView({super.key});

  @override
  State<BannerView> createState() => _BannerViewState();
}

class _BannerViewState extends State<BannerView> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    return Stack(
      children: [ 
        // page view
        PageView.builder(
          controller: _pageController,
          onPageChanged: (index){
            setState(() {
              _currentIndex = index;
            });
          },
          itemBuilder: (_,index)=> Container(
              height: 200,
              margin: EdgeInsets.symmetric(horizontal: 6),
              decoration: BoxDecoration(
                  // color: Colors.yellow,
                  image:DecorationImage(image: AssetImage("assets/images/12.png",),fit: BoxFit.fill) ,
                  borderRadius: BorderRadius.circular(16)
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0,left: 16,top: 24,bottom: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "UP TO \n25% OFF",
                      style: theme.headlineSmall!.copyWith(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "For All Headphones\n& AirPods",
                      style: theme.labelLarge!.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                    SizedBox(
                      child: ElevatedButton(
                        onPressed: (){},
                          style:ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                          shape:RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                          )
                          ),
                        child:  Text(
                        "Shop Now",
                        style: theme.labelMedium!.copyWith(
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),),
                    )
                  ],
                ),
              ),
            ),
           itemCount: 3,

        ),
      // smooth indicators
        Positioned(
          top: 180,
          left: 160,

          child: Row(
            children:List.generate(3, (index)=>Container(
              height: 5,
              width: 5,
              margin: EdgeInsets.all(3),
              decoration: BoxDecoration(
                  color: index == _currentIndex?AppColors.primaryColor:AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(20)
              ),
            )),
          ),
        )
      ],
     
    ) ;
  }
}
