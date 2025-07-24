// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class CustomBottomNavBar extends StatelessWidget {
//   final int selectedIndex;
//   final Function(int) onTap;
//   final List<String> icons;
//   final List<String> labels;

//   const CustomBottomNavBar({
//     super.key,
//     required this.selectedIndex,
//     required this.onTap,
//     this.icons = const [
//       'assets/icons/home.svg',
//       'assets/icons/search.svg',
//       'assets/icons/settings.svg',
//     ],
//     this.labels = const [
//       'Home',
//       'Search',
//       'Settings',
//     ],
//   });

//   @override
//   Widget build(BuildContext context) {
//     // Active/inactive colors matching your design
//     const activeColor = Color(0xFFFFD54F);
//     const inactiveColor = Color(0xFFC4C4C4);
//     const backgroundColor = Color(0xff282f291a);

//     return Container(
//       height: 70.h,
//       decoration: BoxDecoration(
//         color: backgroundColor.withOpacity(0.1),
//         borderRadius: BorderRadius.circular(50.r),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             blurRadius: 10,
//             offset: const Offset(0, -5),
//           ),
//         ],
//       ),
//       margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: List.generate(icons.length, (index) {
//           bool isSelected = selectedIndex == index;

//           return GestureDetector(
//             onTap: () => onTap(index),
//             child: AnimatedContainer(
//               duration: const Duration(milliseconds: 300),
//               curve: Curves.easeInOut,
//               width: isSelected ? 120.w : 60.w,
//               height: 50.h,
//               decoration: BoxDecoration(
//                 color: isSelected ? activeColor : Colors.transparent,
//                 borderRadius: BorderRadius.circular(25.r),
//               ),
//               alignment: Alignment.center,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   // Icon with color change based on selection
//                   SvgPicture.asset(
//                     icons[index],
//                     width: 24.w,
//                     height: 24.h,
//                     colorFilter: ColorFilter.mode(
//                       isSelected
//                           ? Colors.black.withOpacity(0.8)
//                           : inactiveColor,
//                       BlendMode.srcIn,
//                     ),
//                   ),
//                   // Animated label that appears when selected
//                   if (isSelected)
//                     AnimatedOpacity(
//                       opacity: isSelected ? 1.0 : 0.0,
//                       duration: const Duration(milliseconds: 200),
//                       curve: Curves.easeIn,
//                       child: Padding(
//                         padding: EdgeInsets.only(left: 8.w),
//                         child: Text(
//                           labels[index],
//                           style: TextStyle(
//                             fontSize: 12.sp,
//                             fontWeight: FontWeight.w600,
//                             color: Colors.black.withOpacity(0.8),
//                           ),
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ),
//                     ),
//                 ],
//               ),
//             ),
//           );
//         }),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;
  final List<String> icons;
  final List<String> labels;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
    required this.icons,
    required this.labels,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(icons.length, (index) {
          bool isSelected = selectedIndex == index;

          return InkWell(
            onTap: () => onTap(index),
            child: Container(
              width: 90.w, // Increase width for better tap area
              height: 60.h, // Increase height for better tap area
              // decoration:
              //     BoxDecoration(border: Border.all(color: Colors.black)),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Icon with gradient when selected, black when not
                  isSelected
                      ? ShaderMask(
                          shaderCallback: (bounds) => const LinearGradient(
                            colors: [Color(0xFFF36DA3), Color(0xFF51E3D3)],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ).createShader(bounds),
                          blendMode: BlendMode.srcIn,
                          child: SvgPicture.asset(
                            icons[index],
                            width: 24.w,
                            height: 24.h,
                          ),
                        )
                      : SvgPicture.asset(
                          icons[index],
                          width: 24.w,
                          height: 24.h,
                          color: Colors.black,
                        ),
                  SizedBox(height: 4.h),
                  // Label with gradient when selected, black when not
                  isSelected
                      ? ShaderMask(
                          shaderCallback: (bounds) => const LinearGradient(
                            colors: [Color(0xFFF36DA3), Color(0xFF51E3D3)],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ).createShader(bounds),
                          blendMode: BlendMode.srcIn,
                          child: Text(
                            labels[index],
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      : Text(
                          labels[index],
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
