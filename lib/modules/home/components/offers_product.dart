import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webkeyz_task/shared/assets/assets.gen.dart';
import 'package:webkeyz_task/shared/config/colors.dart';

class OffersProductComponent extends StatelessWidget {
  const OffersProductComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Cookies',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40.sp,
                fontWeight: FontWeight.w300,
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () {},
              child: Row(
                children: [
                  Text(
                    'See More',
                    style: TextStyle(
                      color: AppColors.secondaryPrimary,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Assets.icons.rightArrow.svg(),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 35.h,
        ),
        SizedBox(
          height: 140.h,
          width: double.infinity,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return SizedBox(
                width: (MediaQuery.of(context).size.width / 1) - 50.w,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(21.r),
                            topRight: Radius.circular(21.r),
                            bottomLeft: Radius.circular(21.r),
                            bottomRight: Radius.circular(72.r),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 24.w, vertical: 28.h),
                          child: Row(
                            children: [
                              Assets.images.cookie1.image(
                                width: 75.w,
                                height: 75.h,
                              ),
                              SizedBox(
                                width: 15.w,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Double Chocolate',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 6.h,
                                    ),
                                    Row(
                                      children: [
                                        Assets.icons.crownIcon.svg(),
                                        SizedBox(
                                          width: 8.w,
                                        ),
                                        Text(
                                          'Premium'.toUpperCase(),
                                          style: TextStyle(
                                            color: AppColors.secondaryPrimary,
                                            fontSize: 11.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      '20 USD',
                                      style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        color: Colors.white.withAlpha(150),
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      '12 USD',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.black,
                        child: InkWell(
                          onTap: () {},
                          child: Assets.icons.iconArrow.svg(),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                width: 16.w,
              );
            },
            itemCount: 3,
          ),
        ),
      ],
    );
  }
}
