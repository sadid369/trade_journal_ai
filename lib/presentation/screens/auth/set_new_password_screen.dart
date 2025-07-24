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

class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({super.key});

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  String? resetToken;
  late final AuthController authController;

  @override
  void initState() {
    super.initState();
    authController = Get.find<AuthController>();

    // Get the reset_token from the previous screen
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final extra = GoRouterState.of(context).extra;
      print('SetPasswordScreen - Raw extra data: $extra');
      print('SetPasswordScreen - Extra type: ${extra.runtimeType}');

      if (extra is Map<String, dynamic>) {
        setState(() {
          resetToken = extra['reset_token'];
        });
        print('SetPasswordScreen - Reset token received: $resetToken');
      } else if (extra is Map) {
        setState(() {
          resetToken = extra['reset_token'];
        });
        print('SetPasswordScreen - Reset token received (Map): $resetToken');
      } else {
        print('SetPasswordScreen - No valid extra data received');
      }
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _obscureConfirmPassword = !_obscureConfirmPassword;
    });
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.passwordRequired.tr;
    }
    if (!AppStrings.passwordRegex.hasMatch(value)) {
      return AppStrings.passWordMustBeAtLeast.tr;
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.confirmPasswordRequired.tr;
    }
    if (value != _passwordController.text) {
      return AppStrings.passwordsDoNotMatch.tr;
    }
    return null;
  }

  void _updatePassword() {
    print('SetPasswordScreen - Update password called with token: $resetToken');

    if (_formKey.currentState!.validate()) {
      if (resetToken != null && resetToken!.isNotEmpty) {
        print(
            'SetPasswordScreen - Calling setNewPassword with token: $resetToken');
        authController.setNewPassword(
          context,
          _passwordController.text,
          _confirmPasswordController.text,
          resetToken!,
        );
      } else {
        print('SetPasswordScreen - Reset token is null or empty');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Reset token is missing. Please try again.")),
        );
      }
    } else {
      print('SetPasswordScreen - Form validation failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Back Button
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
                  // Title
                  Text(
                    AppStrings.setANewPassword.tr,
                    style: AppStyle.kohSantepheap18w700C1E1E1E,
                  ),
                  Gap(18.h),
                  Text(
                    AppStrings.createANewPassword.tr,
                    style: AppStyle.roboto14w500C989898,
                  ),
                  Gap(44.h),
                  // Password Field
                  Text(
                    AppStrings.password.tr,
                    style: AppStyle.roboto16w600C2A2A2A,
                  ),
                  Gap(8.h),
                  CustomTextFormField(
                    controller: _passwordController,
                    hintText: AppStrings.enterYourNewPassword.tr,
                    obscureText: _obscurePassword,
                    suffixIcon: _obscurePassword
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    onSuffixIconTap: _togglePasswordVisibility,
                    style: AppStyle.roboto16w500C545454,
                    hintStyle: AppStyle.roboto14w500CB3B3B3,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                    enabledBorderColor: AppColors.black30opacity4D000000,
                    focusedBorderColor: AppColors.primary,
                    enabledBorderWidth: 1.5.w,
                    focusedBorderWidth: 1.8.w,
                    borderRadius: BorderRadius.circular(12.r),
                    validator: _validatePassword,
                  ),
                  Gap(16.h),
                  Text(
                    AppStrings.confirmPasswordHint.tr,
                    style: AppStyle.roboto16w600C2A2A2A,
                  ),
                  Gap(8.h),
                  CustomTextFormField(
                    controller: _confirmPasswordController,
                    hintText: AppStrings.reEnterPassword.tr,
                    obscureText: _obscureConfirmPassword,
                    suffixIcon: _obscureConfirmPassword
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    onSuffixIconTap: _toggleConfirmPasswordVisibility,
                    style: AppStyle.roboto16w500C545454,
                    hintStyle: AppStyle.roboto14w500CB3B3B3,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                    enabledBorderColor: AppColors.black30opacity4D000000,
                    focusedBorderColor: AppColors.primary,
                    enabledBorderWidth: 1.5.w,
                    focusedBorderWidth: 1.8.w,
                    borderRadius: BorderRadius.circular(12.r),
                    validator: _validateConfirmPassword,
                  ),
                  Gap(30.h),
                  Obx(() => AppButton(
                        text: AppStrings.updatePassword.tr,
                        onPressed: authController.isLoading.value
                            ? null
                            : _updatePassword,
                        width: double.infinity,
                        height: 48.h,
                        backgroundColor: AppColors.primary,
                        borderRadius: 8.r,
                        textStyle: AppStyle.inter16w700CFFFFFF,
                        enabled: !authController.isLoading.value,
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
