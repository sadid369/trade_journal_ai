import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
import '../../widgets/custom_text_form_field/custom_text_form.dart';
import 'controller/auth_controller.dart';

class AdminSignUpScreen extends StatefulWidget {
  const AdminSignUpScreen({super.key});

  @override
  AdminSignUpScreenState createState() => AdminSignUpScreenState();
}

class AdminSignUpScreenState extends State<AdminSignUpScreen> {
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              child: Form(
                key: authController.formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Gap(16.h),
                    Text(
                      AppStrings.signUp.tr,
                      style: AppStyle.roboto30w5001D1B20,
                    ),
                    Gap(30.h),
                    CustomTextFormField(
                      controller: authController.fullNameController,
                      validator: authController.validateFullName,
                      labelText: AppStrings.fullName.tr,
                      hintText: AppStrings.enterYourFullName.tr,
                      suffixIcon: Icons.person_outline,
                      obscureText: false,
                      hintStyle: AppStyle.roboto14w500CB3B3B3,
                      style: AppStyle.roboto16w500C545454,
                      labelStyle: AppStyle.roboto14w500C000000,
                      enabledBorderColor: AppColors.black30opacity4D000000,
                      focusedBorderColor: AppColors.primary,
                      errorBorderColor: Colors.red,
                      focusedErrorBorderColor: Colors.red,
                      fillColor: Colors.white,
                      contentPadding:
                          EdgeInsets.fromLTRB(16.w, 20.h, 16.w, 14.h),
                    ),
                    Gap(35.h),
                    CustomTextFormField(
                      controller: authController.emailController,
                      validator: authController.validateEmail,
                      labelText: AppStrings.email.tr,
                      hintText: AppStrings.enterYourEmailHint.tr,
                      suffixIcon: Icons.email_outlined,
                      keyboardType: TextInputType.emailAddress,
                      obscureText: false,
                      hintStyle: AppStyle.roboto14w500CB3B3B3,
                      style: AppStyle.roboto16w500C545454,
                      labelStyle: AppStyle.roboto14w500C000000,
                      enabledBorderColor: AppColors.black30opacity4D000000,
                      focusedBorderColor: AppColors.primary,
                      errorBorderColor: Colors.red,
                      focusedErrorBorderColor: Colors.red,
                      fillColor: Colors.white,
                      contentPadding:
                          EdgeInsets.fromLTRB(16.w, 20.h, 16.w, 14.h),
                    ),
                    Gap(35.h),
                    Obx(() => CustomTextFormField(
                          controller: authController.passwordController,
                          validator: authController.validatePassword,
                          labelText: AppStrings.password.tr,
                          hintText: AppStrings.password.tr,
                          suffixIcon: authController.passwordVisible.value
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          obscureText: !authController.passwordVisible.value,
                          onSuffixIconTap:
                              authController.togglePasswordVisibility,
                          hintStyle: AppStyle.roboto14w500CB3B3B3,
                          style: AppStyle.roboto16w500C545454,
                          labelStyle: AppStyle.roboto14w500C000000,
                          enabledBorderColor: AppColors.black30opacity4D000000,
                          focusedBorderColor: AppColors.primary,
                          errorBorderColor: Colors.red,
                          focusedErrorBorderColor: Colors.red,
                          fillColor: Colors.white,
                          contentPadding:
                              EdgeInsets.fromLTRB(16.w, 20.h, 16.w, 14.h),
                        )),
                    Gap(35.h),
                    Obx(() => CustomTextFormField(
                          controller: authController.confirmPasswordController,
                          validator: authController.validateConfirmPassword,
                          labelText: AppStrings.confirmPasswordHint.tr,
                          hintText: AppStrings.confirmPasswordHint.tr,
                          suffixIcon: authController.passwordVisible.value
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          obscureText: !authController.passwordVisible.value,
                          onSuffixIconTap:
                              authController.togglePasswordVisibility,
                          hintStyle: AppStyle.roboto14w500CB3B3B3,
                          style: AppStyle.roboto16w500C545454,
                          labelStyle: AppStyle.roboto14w500C000000,
                          enabledBorderColor: AppColors.black30opacity4D000000,
                          focusedBorderColor: AppColors.primary,
                          errorBorderColor: Colors.red,
                          focusedErrorBorderColor: Colors.red,
                          fillColor: Colors.white,
                          contentPadding:
                              EdgeInsets.fromLTRB(16.w, 20.h, 16.w, 14.h),
                        )),
                    Gap(20.h),
                    Row(
                      children: [
                        Obx(() => Checkbox(
                              value: authController.rememberMe.value,
                              onChanged: authController.toggleRememberMe,
                              activeColor: AppColors.primary,
                              side: BorderSide(
                                color: authController.rememberMe.value
                                    ? AppColors.primary
                                    : const Color(0xff999999),
                              ),
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              visualDensity: VisualDensity.compact,
                            )),
                        Text(
                          AppStrings.rememberMe.tr,
                          style: AppStyle.roboto14w400999999,
                        ),
                      ],
                    ),
                    Gap(33.h),
                    Obx(() => AppButton(
                          text: authController.isLoading.value
                              ? AppStrings.creatingAccount.tr
                              : AppStrings.signUp.tr,
                          onPressed: authController.isLoading.value
                              ? null
                              : () => authController.signUp(context),
                          width: double.infinity,
                          height: 48.h,
                          backgroundColor: authController.isLoading.value
                              ? AppColors.primary.withOpacity(0.6)
                              : AppColors.primary,
                          borderRadius: 8.r,
                          textStyle: AppStyle.inter16w700CFFFFFF,
                        )),
                    Gap(15.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppStrings.dontHaveAAccount.tr,
                          style: AppStyle.roboto14w400999999,
                        ),
                        Gap(4.w),
                        GestureDetector(
                          onTap: () {
                            context.push(RoutePath.login.addBasePath);
                          },
                          child: Stack(
                            alignment: Alignment.centerLeft,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 2.h),
                                child: Text(
                                  AppStrings.signIn.tr,
                                  style: AppStyle.inter14w500999999,
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  height: 2.h,
                                  color: Color(0xFF999999),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Gap(12.h),
                    Text(
                      AppStrings.or.tr,
                      style: AppStyle.roboto14w500C80000000,
                    ),
                    Gap(12.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildSocialIcon(
                          iconPath: Assets.icons.appleIcon.path,
                          onTap: () => authController.loginWithApple(context),
                        ),
                        Gap(15.w),
                        _buildSocialIcon(
                          iconPath: Assets.icons.googleIcon.path,
                          onTap: authController.loginWithGoogle,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialIcon({
    required String iconPath,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 20.r,
        child: SvgPicture.asset(iconPath, width: 24.w, height: 24.w),
      ),
    );
  }
}
