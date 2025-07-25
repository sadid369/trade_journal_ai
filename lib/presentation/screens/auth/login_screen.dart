import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:get/get.dart';
import 'package:trade_journal_ai/helper/extension/base_extension.dart';

import '../../../core/routes/routes.dart';
import '../../widgets/custom_bottons/custom_button/app_button.dart';
import '../../widgets/custom_text_form_field/custom_text_form.dart';
import '../../../core/routes/route_path.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/static_strings/static_strings.dart';
import '../../../core/custom_assets/assets.gen.dart';
import '../../../utils/text_style/text_style.dart';
import 'controller/auth_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Gap(15.h),
                  Text(
                    AppStrings.signIn.tr,
                    style: AppStyle.roboto30w5001D1B20,
                  ),
                  Gap(88.h),
                  CustomTextFormField(
                    controller: authController.emailController,
                    labelText: AppStrings.email.tr,
                    hintText: AppStrings.enterYourEmailHint.tr,
                    suffixIcon: Icons.email_outlined,
                    obscureText: false,
                    hintStyle: AppStyle.roboto14w500CB3B3B3,
                    style: AppStyle.roboto16w500C545454,
                    labelStyle: AppStyle.roboto14w500C000000,
                    enabledBorderColor: AppColors.black30opacity4D000000,
                    focusedBorderColor: AppColors.primary,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.fromLTRB(16.w, 20.h, 16.w, 14.h),
                  ),
                  Gap(35.h),
                  Obx(() => CustomTextFormField(
                        controller: authController.passwordController,
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
                        fillColor: Colors.white,
                        contentPadding:
                            EdgeInsets.fromLTRB(16.w, 20.h, 16.w, 14.h),
                      )),
                  Gap(6.73.h),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        context.push(RoutePath.forgotPass.addBasePath);
                      },
                      child: Text(
                        AppStrings.forgotPassword.tr,
                        style: AppStyle.roboto14w500047CFE,
                      ),
                    ),
                  ),
                  Obx(() => Row(
                        children: [
                          Checkbox(
                            value: authController.rememberMe.value,
                            onChanged: authController.toggleRememberMe,
                            activeColor: AppColors.primary,
                            //want to change checkbox border color when in active
                            side: BorderSide(
                              color: authController.rememberMe.value
                                  ? AppColors.primary
                                  : const Color(0xff999999),
                            ),

                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            visualDensity: VisualDensity.compact,
                          ),
                          Text(
                            AppStrings.rememberMe.tr,
                            style: AppStyle.roboto14w400999999,
                          ),
                        ],
                      )),
                  Gap(33.h),
                  Obx(() => AppButton(
                        text: AppStrings.signIn.tr,
                        onPressed: authController.isLoading.value
                            ? null
                            // : () => authController.login(context),
                            : () {
                                context
                                    .push(RoutePath.welcomeScreen.addBasePath);
                              },
                        // onPressed: () {
                        //   context.push(RoutePath.adminDashboard.addBasePath);
                        // },
                        width: double.infinity,
                        height: 48.h,
                        backgroundColor: authController.isLoading.value
                            ? AppColors.primary.withOpacity(0.6)
                            : AppColors.primary,
                        borderRadius: 8.r,
                        textStyle: AppStyle.inter16w700CFFFFFF,
                      )),
                  Gap(28.h),
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
                          context.push(RoutePath.adminSignUp.addBasePath);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 2.w,
                                color: Color(0xFF999999),
                              ),
                            ),
                          ),
                          child: Text(
                            AppStrings.signUp.tr,
                            style: AppStyle.inter14w500999999,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Gap(20.h),
                  Text(
                    AppStrings.or.tr,
                    style: AppStyle.roboto14w500C80000000,
                  ),
                  Gap(20.h),
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
