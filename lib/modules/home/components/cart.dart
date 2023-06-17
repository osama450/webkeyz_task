import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webkeyz_task/modules/home/cubit/cubit.dart';
import 'package:webkeyz_task/shared/assets/assets.gen.dart';
import 'package:webkeyz_task/shared/config/colors.dart';

class CartComponent extends StatefulWidget {
  const CartComponent({
    super.key,
  });

  @override
  State<CartComponent> createState() => _CartComponentState();
}

class _CartComponentState extends State<CartComponent> {
  late HomeCubit cubit;
  @override
  void initState() {
    super.initState();
    cubit = context.read<HomeCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: cubit,
      builder: (context, state) {
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
                            BlocProvider.of<HomeCubit>(context)
                                .cartCount
                                .toString(),
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
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Align(
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
              ),
            ],
          ),
        );
      },
    );
  }
}
