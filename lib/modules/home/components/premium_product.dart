import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webkeyz_task/models/response/product_model.dart';
import 'package:webkeyz_task/modules/home/product_details_screen.dart';
import 'package:webkeyz_task/shared/assets/assets.gen.dart';
import 'package:webkeyz_task/shared/config/colors.dart';

class PremiumProductComponent extends StatelessWidget {
  final List<ProductModel> products;
  const PremiumProductComponent({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Row(
            children: [
              Text(
                'Premium',
                style: TextStyle(
                  color: AppColors.secondaryPrimary,
                  fontSize: 28.sp,
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
        ),
        SizedBox(
          height: 35.h,
        ),
        SizedBox(
          height: 300.h,
          width: double.infinity,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return SizedBox(
                width: (MediaQuery.of(context).size.width / 2) - 35.w,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 180.h,
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
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                products[index].name!,
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
                              SizedBox(
                                height: 6.h,
                              ),
                              Text(
                                products[index].price!,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.h),
                      child: FadeInDown(
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Image.asset(
                            products[index].image!,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailsScreen(
                              product: products[index],
                            ),
                          ),
                        );
                      },
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.black,
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
            itemCount: products.length,
          ),
        ),
      ],
    );
  }
}
