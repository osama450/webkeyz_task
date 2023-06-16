import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webkeyz_task/modules/home/components/cart.dart';
import 'package:webkeyz_task/modules/home/components/offers_product.dart';
import 'package:webkeyz_task/modules/home/components/premium_product.dart';
import 'package:webkeyz_task/modules/home/components/user_info.dart';
import 'package:webkeyz_task/shared/config/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
            vertical: 14.h,
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    UserInfoComponent(),
                    Spacer(),
                    CartComponent(),
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  'Cookies',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.sp,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const PremiumProductComponent(),
                SizedBox(
                  height: 16.h,
                ),
                const OffersProductComponent(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
