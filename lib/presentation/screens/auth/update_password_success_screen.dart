import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:get/get.dart';
import 'package:trade_journal_ai/helper/extension/base_extension.dart';

import '../../../core/routes/route_path.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/static_strings/static_strings.dart';
import '../../../utils/text_style/text_style.dart';
import '../../widgets/custom_bottons/custom_button/app_button.dart';

class UpdatePasswordSuccessScreen extends StatelessWidget {
  const UpdatePasswordSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Light beige background
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Circle with checkmark icon
              Container(
                width: 98.w,
                height: 98.h,
                decoration: BoxDecoration(
                  color: const Color(0xFFE5FFFC),
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.primary, width: 2.w),
                ),
                child: Center(
                  child: Icon(
                    Icons.check,
                    color: AppColors.primary,
                    size: 40.w,
                  ),
                ),
              ),
              Gap(31.h),
              // White card container
              Container(
                width: 380.w,
                padding: EdgeInsets.all(22.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4.r),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      AppStrings.successful.tr,
                      style: AppStyle.robotoSerif20w600C1E1E1E,
                    ),
                    Gap(24.h),
                    Text(
                      AppStrings.congratulations.tr,
                      style: AppStyle.roboto16w500C989898,
                      textAlign: TextAlign.center,
                    ),
                    Gap(33.h),
                    AppButton(
                      text: AppStrings.updatePassword.tr,
                      onPressed: () {
                        context.push(RoutePath.login.addBasePath);
                      },
                      width: 268.w,
                      height: 44.h,
                      backgroundColor: AppColors.primary,
                      borderRadius: 15.r,
                      textStyle: AppStyle.inter16w700CFFFFFF,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
