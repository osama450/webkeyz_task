import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webkeyz_task/models/response/product_model.dart';
import 'package:webkeyz_task/modules/home/widgets/add_to_cart_button.dart';
import 'package:webkeyz_task/shared/assets/assets.gen.dart';
import '../../../shared/config/colors.dart';

class ProductDetailsInfoComponent extends StatelessWidget {
  const ProductDetailsInfoComponent({
    super.key,
    required this.product,
  });
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return FadeInUpBig(
      duration: const Duration(milliseconds: 800),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
          Text(
            'Cookies',
            style: TextStyle(
              color: Colors.white,
              fontSize: 80.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            product.name!,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  product.description!,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                width: 24.w,
              ),
              const AddToCartButtonWidget(),
            ],
          ),
        ],
      ),
    );
  }
}
