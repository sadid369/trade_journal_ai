import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:get/get.dart';

import '../../../core/custom_assets/assets.gen.dart';
import '../../../core/routes/route_path.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/static_strings/static_strings.dart';
import '../../../utils/text_style/text_style.dart';
import '../../widgets/custom_bottons/custom_button/app_button.dart';
import '../../widgets/custom_text_form_field/custom_text_form.dart';
import 'controller/auth_controller.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late final AuthController authController;

  @override
  void initState() {
    super.initState();
    // Get existing controller or create new one
    authController = Get.isRegistered<AuthController>()
        ? Get.find<AuthController>()
        : Get.put(AuthController());
  }

  @override
  void dispose() {
    // Don't dispose the controller here since it might be used elsewhere
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
          child: Form(
            key: authController.forgotPasswordFormKey,
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
                Gap(30.h),
                Text(
                  AppStrings.forgotPassword.tr,
                  style: AppStyle.kohSantepheap18w700C1E1E1E,
                ),
                Gap(8.h),
                Text(
                  AppStrings.pleaseEnterYourEmailToReset.tr,
                  style: AppStyle.roboto14w600C989898,
                ),
                Gap(20.h),
                Text(
                  AppStrings.youEmail.tr,
                  style: AppStyle.roboto16w600C2A2A2A,
                ),
                Gap(8.h),
                CustomTextFormField(
                  controller: authController.forgotPasswordEmailController,
                  validator: authController.validateEmail,
                  hintText: AppStrings.enterYourEmailHint.tr,
                  keyboardType: TextInputType.emailAddress,
                  style: AppStyle.roboto16w500C545454,
                  hintStyle: AppStyle.roboto14w500CB3B3B3,
                  fillColor: Colors.transparent,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                  enabledBorderColor: AppColors.borderE1E1E1,
                  focusedBorderColor: AppColors.primary,
                  errorBorderColor: Colors.red,
                  focusedErrorBorderColor: Colors.red,
                  enabledBorderWidth: 1.5.w,
                  focusedBorderWidth: 1.8.w,
                  borderRadius: BorderRadius.circular(12.r),
                  filled: true,
                  obscureText: false,
                ),
                Gap(30.h),
                Obx(() => AppButton(
                      text: authController.isLoading.value
                          ? "Sending..."
                          : AppStrings.passwordReset.tr,
                      onPressed: authController.isLoading.value
                          ? null
                          : authController.isResetButtonEnabled.value
                              ? () => authController.forgotPassword(context)
                              : null,
                      width: double.infinity,
                      height: 48.h,
                      backgroundColor:
                          authController.isResetButtonEnabled.value &&
                                  !authController.isLoading.value
                              ? AppColors.primary
                              : AppColors.primary.withOpacity(0.4),
                      borderRadius: 10.r,
                      textStyle: AppStyle.inter16w700CFFFFFF,
                      enabled: authController.isResetButtonEnabled.value &&
                          !authController.isLoading.value,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
