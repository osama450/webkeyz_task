import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:webkeyz_task/modules/home/components/cart.dart';
import 'package:webkeyz_task/modules/home/components/offers_product.dart';
import 'package:webkeyz_task/modules/home/components/premium_product.dart';
import 'package:webkeyz_task/modules/home/components/user_info.dart';
import 'package:webkeyz_task/modules/home/cubit/cubit.dart';
import 'package:webkeyz_task/modules/home/cubit/states.dart';
import 'package:webkeyz_task/shared/config/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: BlocConsumer<HomeCubit, HomeStates>(
        listener: (BuildContext context, HomeStates state) {},
        builder: (BuildContext context, HomeStates state) {
          final HomeCubit cubit = HomeCubit.get(context);
          return state is LoadingHomeStatePage
              ? Center(
                  child: LoadingAnimationWidget.threeArchedCircle(
                    color: Colors.black,
                    size: 60,
                  ),
                )
              : state is ErrorHomeState
                  ? Center(
                      child: Text(
                        state.error.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )
                  : SafeArea(
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
                              PremiumProductComponent(
                                products: cubit.productList,
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                              OffersProductComponent(
                                products: cubit.productList,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
        },
      ),
    );
  }
}
