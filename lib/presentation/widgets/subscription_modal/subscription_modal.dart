import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:gap/gap.dart';

import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/static_strings/static_strings.dart';
import '../../../utils/text_style/text_style.dart';
import '../custom_bottons/custom_button/app_button.dart';

// Model for static plans
class SubscriptionPlan {
  final String title; // translation key
  final String price;
  final String priceSuffix;
  final List<String> features;

  SubscriptionPlan({
    required this.title,
    required this.price,
    this.priceSuffix = '/month',
    required this.features,
  });
}

class SubscriptionModal extends StatefulWidget {
  final List<SubscriptionPlan> plans;
  final VoidCallback onSubscribe;

  const SubscriptionModal({
    super.key,
    required this.plans,
    required this.onSubscribe,
  });

  @override
  State<SubscriptionModal> createState() => _SubscriptionModalState();
}

class _SubscriptionModalState extends State<SubscriptionModal> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9, // Reduced width
        height: MediaQuery.of(context).size.height * 0.81, // Reduced height
        decoration: BoxDecoration(
          color: const Color(0xFFF5F7F8),
          borderRadius: BorderRadius.circular(24.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(
                    AppStrings.cancel.tr,
                    style: AppStyle.roboto12w700CFFD673,
                  ),
                ),
              ),
              Text(
                AppStrings.getUnlimitedAccess.tr,
                style: AppStyle.kohSantepheap16w700C090A0A,
                textAlign: TextAlign.center,
              ),
              Gap(6.h),
              SizedBox(
                width: 300.w,
                child: Text(
                  AppStrings.takeFirstStep.tr,
                  style: AppStyle.roboto12w400C090A0A,
                  textAlign: TextAlign.center,
                ),
              ),
              Gap(20.h),
              ...List.generate(widget.plans.length, (index) {
                final plan = widget.plans[index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: PlanCard(
                    plan: plan,
                    isHighlighted: selectedIndex == index,
                  ),
                );
              }),
              Gap(6.h),
              AppButton(
                text: AppStrings.subscribe.tr,
                onPressed: selectedIndex != null ? widget.onSubscribe : null,
                width: 200.w,
                height: 44.h,
                backgroundColor: AppColors.primary,
                borderRadius: 30.r,
                textStyle: AppStyle.inter16w700CFFFFFF,
                enabled: selectedIndex != null,
              ),
              Gap(16.h),
              Text(
                AppStrings.pricingInfo.tr,
                style: AppStyle.inter12w400C090A0A,
                textAlign: TextAlign.center,
              ),
              Gap(8.h),
            ],
          ),
        ),
      ),
    );
  }
}

class PlanCard extends StatelessWidget {
  final SubscriptionPlan plan;
  final bool isHighlighted;

  const PlanCard({
    super.key,
    required this.plan,
    required this.isHighlighted,
  });

  @override
  Widget build(BuildContext context) {
    final borderColor =
        isHighlighted ? AppColors.primary : Colors.black.withAlpha(26);
    final backgroundColor = isHighlighted ? Colors.white : Colors.transparent;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      margin: EdgeInsets.only(bottom: 20.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: backgroundColor,
        border: Border.all(color: borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            plan.title.tr,
            style: AppStyle.roboto16w500C090A0A,
          ),
          Gap(8.h),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: plan.price,
                  style: AppStyle.roboto14w700CFFD673,
                ),
                TextSpan(
                  text: ' ${plan.priceSuffix}',
                  style: AppStyle.roboto14w400C090A0A,
                ),
              ],
            ),
          ),
          Gap(12.h),
          ...plan.features.map(
            (feature) => Padding(
              padding: EdgeInsets.only(bottom: 8.h),
              child: Row(
                children: [
                  Icon(
                    Icons.check_box_outlined,
                    color: AppColors.primary,
                    size: 15.sp,
                  ),
                  Gap(8.w),
                  Expanded(
                    child: Text(
                      feature.tr,
                      style: AppStyle.roboto12w400C000000,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
