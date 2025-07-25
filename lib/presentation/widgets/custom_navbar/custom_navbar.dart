import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/custom_assets/assets.gen.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;
  final List<SvgGenImage> selectedIcons;
  final List<SvgGenImage> unselectedIcons;
  final List<String> labels;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
    required this.selectedIcons,
    required this.unselectedIcons,
    required this.labels,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(labels.length, (index) {
          final isSelected = selectedIndex == index;
          return InkWell(
            onTap: () => onTap(index),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                isSelected
                    ? selectedIcons[index].svg(
                        width: 24.w,
                        height: 24.h,
                        colorFilter: const ColorFilter.mode(
                          Colors.black,
                          BlendMode.srcIn,
                        ),
                      )
                    : unselectedIcons[index].svg(
                        width: 24.w,
                        height: 24.h,
                        colorFilter: const ColorFilter.mode(
                          Colors.black,
                          BlendMode.srcIn,
                        ),
                      ),
                SizedBox(height: 4.h),
                Text(
                  labels[index],
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight:
                        isSelected ? FontWeight.bold : FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
