import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:get/get.dart';
import 'package:trade_journal_ai/helper/extension/base_extension.dart';

import '../../../core/custom_assets/assets.gen.dart';
import '../../../core/routes/route_path.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/static_strings/static_strings.dart';
import '../../../utils/text_style/text_style.dart';
import '../../widgets/custom_bottons/custom_button/app_button.dart';

class PasswordResetConfirmScreen extends StatefulWidget {
  const PasswordResetConfirmScreen({super.key});

  @override
  State<PasswordResetConfirmScreen> createState() =>
      _PasswordResetConfirmScreenState();
}

class _PasswordResetConfirmScreenState
    extends State<PasswordResetConfirmScreen> {
  String? resetToken;

  @override
  void initState() {
    super.initState();
    // Get the passed data from verification screen
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final extra = GoRouterState.of(context).extra;
      print('PasswordResetConfirmScreen - Raw extra data: $extra');
      print('PasswordResetConfirmScreen - Extra type: ${extra.runtimeType}');

      if (extra is Map<String, dynamic>) {
        setState(() {
          resetToken = extra['reset_token'];
        });
        print('PasswordResetConfirmScreen - Reset token received: $resetToken');
      } else if (extra is Map) {
        setState(() {
          resetToken = extra['reset_token'];
        });
        print(
            'PasswordResetConfirmScreen - Reset token received (Map): $resetToken');
      } else {
        print('PasswordResetConfirmScreen - No valid extra data received');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  context.pop();
                },
                child: Image.asset(
                  Assets.icons.backArrow.path,
                  width: 24.w,
                  height: 24.w,
                ),
              ),
              Gap(53.h),
              Text(
                AppStrings.passwordReset.tr,
                style: AppStyle.kohSantepheap18w700C1E1E1E,
              ),
              Gap(18.h),
              Text(
                AppStrings.confirmPassword.tr,
                style: AppStyle.roboto14w500C989898,
              ),
              Gap(32.h),
              AppButton(
                text: AppStrings.confirm.tr,
                onPressed: resetToken != null
                    ? () {
                        print(
                            'PasswordResetConfirmScreen - Navigating with token: $resetToken');
                        // Pass the reset_token to the set password screen
                        context.go(RoutePath.resetPass.addBasePath, extra: {
                          "reset_token": resetToken,
                        });
                      }
                    : null,
                width: double.infinity,
                height: 48.h,
                backgroundColor: AppColors.primary,
                borderRadius: 8.r,
                textStyle: AppStyle.inter16w700CFFFFFF,
                enabled: resetToken != null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
