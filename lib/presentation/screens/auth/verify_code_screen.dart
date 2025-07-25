import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:get/get.dart'; // for .tr translations
import 'package:trade_journal_ai/helper/extension/base_extension.dart';

import '../../../utils/text_style/text_style.dart';
import 'controller/auth_controller.dart';
import '../../../core/custom_assets/assets.gen.dart';
import '../../../core/routes/route_path.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/static_strings/static_strings.dart';
import '../../widgets/custom_bottons/custom_button/app_button.dart';
import '../../widgets/custom_text_form_field/custom_text_form.dart';

class CodeVerificationScreen extends StatefulWidget {
  const CodeVerificationScreen({super.key});

  @override
  State<CodeVerificationScreen> createState() => _CodeVerificationScreenState();
}

class _CodeVerificationScreenState extends State<CodeVerificationScreen> {
  final int codeLength = 6;
  final List<TextEditingController> controllers = [];
  final List<FocusNode> focusNodes = [];
  String? email;
  bool isResetPassword = false; // Flag to identify the flow
  late final AuthController authController;

  bool get isCodeComplete =>
      controllers.every((controller) => controller.text.isNotEmpty);

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < codeLength; i++) {
      controllers.add(TextEditingController());
      focusNodes.add(FocusNode());
    }
    authController = Get.find<AuthController>();
    // Get email and flow type from GoRouter extra after build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final extra = GoRouterState.of(context).extra;
      if (extra is Map) {
        setState(() {
          email = extra['email'];
          isResetPassword = extra['isResetPassword'] ?? false;
        });
      }
    });
  }

  @override
  void dispose() {
    for (final controller in controllers) {
      controller.dispose();
    }
    for (final node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _onCodeChanged(int index, String value) {
    if (value.length > 1) {
      controllers[index].text = value[0];
    }
    if (value.isNotEmpty && index < codeLength - 1) {
      FocusScope.of(context).requestFocus(focusNodes[index + 1]);
    } else if (value.isEmpty && index > 0) {
      FocusScope.of(context).requestFocus(focusNodes[index - 1]);
    }
    setState(() {});
  }

  void _verifyCode() {
    // final code = controllers.map((c) => c.text).join();
    // if (isCodeComplete && email != null) {
    //   if (isResetPassword) {
    //     // For forgot password flow
    //     authController.verifyResetPasswordOtp(context, code, email: email);
    //   } else {
    //     // For signup flow
    //     authController.verifyOtp(context, code, email: email);
    //   }
    // }
    Future.delayed(const Duration(seconds: 1), () {
      context.go(RoutePath.resetPassConfirm.addBasePath, extra: {
        "reset_token": "sample_reset_token", // Replace with actual token logic
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back button
                GestureDetector(
                  onTap: () {
                    context.pop();
                  },
                  child: SvgPicture.asset(
                    Assets.icons.backArrow.path,
                    width: 24.w,
                    height: 24.h,
                  ),
                ),
                Gap(16.h),
                Text(
                  AppStrings.checkYourEmail.tr,
                  style: AppStyle.kohSantepheap18w700C1E1E1E,
                ),
                Gap(18.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Wrap(
                            children: [
                              Text(
                                AppStrings.weSent.tr,
                                style: AppStyle.roboto14w600C989898,
                              ),
                              Text(
                                isResetPassword
                                    ? "password reset code"
                                    : AppStrings.emailText.tr,
                                style: AppStyle.roboto14w600C545454,
                              ),
                            ],
                          ),
                          Gap(10.h),
                          Text(
                            AppStrings.enterYour5Digit.tr,
                            style: AppStyle.roboto14w600C989898,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Gap(24.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(codeLength, (index) {
                    return Container(
                      alignment: Alignment.center,
                      width: 56.w,
                      height: 56.h,
                      child: CustomTextFormField(
                        controller: controllers[index],
                        focusNode: focusNodes[index],
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        textAlignVertical: TextAlignVertical.center,
                        maxLength: 1,
                        style: AppStyle.poppins18w600C545454,
                        contentPadding: EdgeInsets.symmetric(vertical: 0.h),
                        borderRadius: BorderRadius.circular(8.r),
                        enabledBorderColor: controllers[index].text.isEmpty
                            ? AppColors.borderE1E1E1
                            : AppColors.primary,
                        enabledBorderWidth: 3.w,
                        focusedBorderColor: AppColors.primary,
                        focusedBorderWidth: 3.w,
                        showCounter: false,
                        filled: false,
                        onChanged: (value) => _onCodeChanged(index, value),
                      ),
                    );
                  }),
                ),
                Gap(24.h),
                Obx(() {
                  final isLoading = authController.isLoading.value;
                  return AppButton(
                    text: AppStrings.verifyCode.tr,
                    onPressed:
                        isCodeComplete && !isLoading ? _verifyCode : null,
                    width: double.infinity,
                    height: 48.h,
                    backgroundColor: AppColors.primary,
                    disabledBackgroundColor: AppColors.primary.withOpacity(0.4),
                    borderRadius: 10.r,
                    textStyle: AppStyle.inter16w700CFFFFFF,
                    enabled: isCodeComplete && !isLoading,
                  );
                }),
                Gap(16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.haveNotGotTheMail.tr,
                      style: AppStyle.inter14w600C989898,
                    ),
                    Gap(4.w),
                    GestureDetector(
                      onTap: () {
                        // TODO: Add resend email logic here
                        if (isResetPassword) {
                          // Resend forgot password OTP
                          authController.forgotPassword(context);
                        } else {
                          // Resend signup OTP
                          authController.signUp(context);
                        }
                      },
                      child: Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 2.h),
                            child: Text(
                              AppStrings.resendEmail.tr,
                              style: AppStyle.inter14w500C7CE3D7,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              height: 2.h,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
