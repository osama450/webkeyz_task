import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webkeyz_task/shared/assets/assets.gen.dart';
import 'package:webkeyz_task/shared/config/colors.dart';

class AppBottomNavigationBar extends StatefulWidget {
  int selectedIndex;
  AppBottomNavigationBar({
    super.key,
    required this.selectedIndex,
  });

  @override
  State<AppBottomNavigationBar> createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
  List<Map<String, dynamic>> buttonNavBarItems = [
    {
      'title': 'Home',
      'icon': Assets.icons.iconHome.svg(
        width: 22.sp,
        height: 22.sp,
      ),
    },
    {
      'title': 'Search',
      'icon': Assets.icons.iconSearch.svg(
        width: 22.sp,
        height: 22.sp,
      ),
    },
    {
      'title': 'Premium',
      'icon': Assets.icons.iconPremium.svg(
        width: 22.sp,
        height: 22.sp,
      ),
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 65.h,
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: buttonNavBarItems
                .asMap()
                .map(
                  (index, value) => MapEntry(
                    index,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          setState(
                            () {
                              widget.selectedIndex = index;
                            },
                          );
                        },
                        child: Column(
                          children: [
                            Container(
                              height: 64,
                              width: 64,
                              decoration: const BoxDecoration(
                                color: AppColors.primaryColor,
                                shape: BoxShape.circle,
                              ),
                              alignment: Alignment.center,
                              child: value['icon'],
                            ),
                            SizedBox(height: 5.h),
                            Text(
                              value['title'],
                              style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                                color: index == widget.selectedIndex
                                    ? AppColors.secondaryPrimary
                                    : Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
                .values
                .toList(),
          ),
        ],
      ),
    );
  }
}
