import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webkeyz_task/modules/home/cubit/cubit.dart';
import 'package:webkeyz_task/shared/assets/assets.gen.dart';
import '../../../shared/config/colors.dart';

class AddToCartButtonWidget extends StatelessWidget {
  const AddToCartButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        BlocProvider.of<HomeCubit>(context).addToCart();
      },
      child: Container(
        width: 85,
        padding: EdgeInsets.symmetric(
          vertical: 16.h,
          horizontal: 16.w,
        ),
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
                CircleAvatar(
                  radius: 25.r,
                  backgroundColor: Colors.black,
                  child: Assets.icons.iconShoppingBag.svg(
                    width: 24.w,
                    height: 24.h,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                const CircleAvatar(
                  backgroundColor: AppColors.secondaryPrimary,
                  radius: 4,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'Add to Order',
                  textAlign: TextAlign.center,
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
    );
  }
}
