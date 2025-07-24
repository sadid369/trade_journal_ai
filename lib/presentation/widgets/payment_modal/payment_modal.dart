import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart'; // for .tr

import '../../../core/custom_assets/assets.gen.dart';
import '../../../utils/static_strings/static_strings.dart';
import '../../../utils/text_style/text_style.dart';
import '../custom_bottons/custom_button/app_button.dart';
import '../custom_text_form_field/custom_text_form.dart';

class PaymentModal extends StatefulWidget {
  const PaymentModal({super.key});

  @override
  State<PaymentModal> createState() => _PaymentModalState();
}

class _PaymentModalState extends State<PaymentModal> {
  bool _useApplePayOffers = false;
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Dialog(
      insetPadding: EdgeInsets.all(22.w),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.r)),
      child: SizedBox(
        width: screenWidth,
        height: 540.h,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 16.h),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(Assets.icons.appleIcon.path),
                          Gap(8.w),
                          Text(
                            AppStrings.appleStorePay.tr,
                            style: AppStyle.roboto16w500C000000,
                          ),
                        ],
                      ),
                      Gap(48.h),
                      Text(
                        AppStrings.completeYourPurchase.tr,
                        style: AppStyle.kohSantepheap20w400C000000,
                      ),
                      Gap(43.h),
                      CustomTextFormField(
                        controller: _emailController,
                        hintText: AppStrings.enterYourEmailHint.tr,
                        keyboardType: TextInputType.emailAddress,
                        borderRadius: BorderRadius.circular(25.r),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 12.h),
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorderColor: Colors.grey,
                        focusedBorderColor: Colors.blue,
                        enabledBorderWidth: 1.5,
                        focusedBorderWidth: 1.8,
                        showCounter: false,
                      ),
                      Gap(36.h),
                      CustomTextFormField(
                        labelText: AppStrings.paymentMethod.tr,
                        labelStyle: AppStyle.roboto16w400C000000,
                        controller: TextEditingController(),
                        style: TextStyle(fontSize: 14.sp),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 14.h, horizontal: 16.w),
                        borderRadius: BorderRadius.circular(25.r),
                        hintText: AppStrings.paymentMethodHint.tr,
                        prefix: Container(
                          width: 40.w,
                          height: 26.h,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                          child: SvgPicture.asset(
                            Assets.icons.appleIcon.path,
                          ),
                        ),
                        keyboardType: TextInputType.text,
                      ),
                      Gap(34.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Checkbox(
                            value: _useApplePayOffers,
                            onChanged: (value) {
                              setState(() {
                                _useApplePayOffers = value ?? false;
                              });
                            },
                          ),
                          Expanded(
                            child: Text(
                              AppStrings.payWithApplePayAndGetOffers.tr,
                              style: AppStyle.roboto14w400C000000,
                            ),
                          )
                        ],
                      ),
                      Gap(10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppStrings.pay.tr,
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16.sp),
                          ),
                          Text(
                            '\$550',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16.sp),
                          ),
                        ],
                      ),
                      Gap(10.h),
                      AppButton(
                        text: AppStrings.payNow.tr,
                        onPressed: () {
                          // Handle Pay Now logic here
                        },
                        width: double.infinity,
                        height: 48.h,
                        backgroundColor: Colors.blue,
                        borderRadius: 24.r,
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
