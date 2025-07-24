import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:get/get.dart'; // <-- add this
import 'package:trade_journal_ai/helper/extension/base_extension.dart';
import 'package:trade_journal_ai/presentation/widgets/custom_bottons/custom_button/app_button.dart';
import 'package:trade_journal_ai/utils/text_style/text_style.dart';

import '../../../core/custom_assets/assets.gen.dart';
import '../../../core/routes/route_path.dart';
import '../../../utils/app_colors/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      // Navigate to the login screen
      context.go(RoutePath.login.addBasePath);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      // color: AppColors.primary,
                    ),
                    child: Image.asset(Assets.icons.icon.path),
                    width: 150.w,
                  ),
                  Text(
                    'Trade Journal AI',
                    style: AppStyle.roboto20w6001D1B20,
                  ),
                  Text(
                    'Your Trades, Your Data, Your Mentor',
                    style: AppStyle.roboto14w5001D1B20,
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppButton(
                    width: 390.w,
                    onPressed: () {
                      // Navigate to the login screen
                      // context.go(RoutePath.login.addBasePath);
                    },
                    text: 'Create New Account',
                    textStyle: AppStyle.roboto18w500FCFCFC,
                  ),
                  Gap(16.w),
                  AppButton(
                    backgroundColor: AppColors.whiteFFFFFF,
                    borderColor: AppColors.borderColor,
                    borderWidth: 1.w,
                    width: 390.w,
                    onPressed: () {
                      // Navigate to the login screen
                      // context.go(RoutePath.login.addBasePath);
                    },
                    text: 'I Already have an Account',
                    textStyle: AppStyle.roboto18w5001D1B20,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
