import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webkeyz_task/shared/assets/assets.gen.dart';
import 'package:webkeyz_task/shared/config/colors.dart';

class CartComponent extends StatelessWidget {
  const CartComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
      width: 79.w,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 82,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
              ),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        '6',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      Text(
                        'Products',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              width: 40.w,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: CircleAvatar(
                      radius: 25.r,
                      backgroundColor: Colors.black,
                      child: Assets.icons.iconShoppingBag.svg(
                        width: 24.w,
                        height: 24.h,
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 0,
                    right: 3,
                    child: CircleAvatar(
                      backgroundColor: AppColors.secondaryPrimary,
                      radius: 4,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
