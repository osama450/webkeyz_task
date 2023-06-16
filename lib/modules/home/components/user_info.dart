import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webkeyz_task/shared/assets/assets.gen.dart';

class UserInfoComponent extends StatelessWidget {
  const UserInfoComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Assets.images.avatar.image(),
        SizedBox(
          width: 16.w,
        ),
        Column(
          children: [
            Text(
              'Ahmed',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              width: 3.w,
            ),
            Text(
              'Elfayoumi',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
