import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webkeyz_task/models/response/product_model.dart';
import 'package:webkeyz_task/modules/home/components/cart.dart';
import 'package:webkeyz_task/modules/home/components/product_details_info.dart';
import 'package:webkeyz_task/modules/home/cubit/cubit.dart';
import 'package:webkeyz_task/modules/home/cubit/states.dart';
import 'package:webkeyz_task/shared/assets/assets.gen.dart';
import '../../shared/widgets/ars_progress_dialog.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({
    super.key,
    required this.product,
  });
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener(
        bloc: BlocProvider.of<HomeCubit>(context),
        listener: (context, HomeStates state) {
          if (state is AddToCartLoadingState) {
            ArsLoadingDialog().show();
          }
          if (state is AddToCartLoadedState) {
            Navigator.pop(context);
          }
        },
        child: Stack(
          children: [
            Assets.images.cookiesImage.image(
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black38,
                    Colors.black26,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 32.w,
                  vertical: 34.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 25.r,
                            child: Assets.icons.iconArrowLeft.svg(),
                          ),
                        ),
                        const Spacer(),
                        const CartComponent(),
                      ],
                    ),
                    const Spacer(),
                    ProductDetailsInfoComponent(
                      product: product,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
