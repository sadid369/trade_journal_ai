import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:gap/gap.dart';

import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/static_strings/static_strings.dart';
import '../../../utils/text_style/text_style.dart';
import '../custom_bottons/custom_button/app_button.dart';

class SubscriptionPlansBottomSheet extends StatefulWidget {
  final void Function(ProductDetails selectedProduct) onSubscribe;

  const SubscriptionPlansBottomSheet({
    super.key,
    required this.onSubscribe,
  });

  @override
  State<SubscriptionPlansBottomSheet> createState() =>
      _SubscriptionPlansBottomSheetState();
}

class _SubscriptionPlansBottomSheetState
    extends State<SubscriptionPlansBottomSheet> {
  int? selectedIndex;
  List<ProductDetails> products = [];
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });
    try {
      // final initialized = await InAppPurchaseService.initialize();
      // if (!initialized) {
      //   throw Exception('Failed to initialize in-app purchase service');
      // }
      // final productList = await InAppPurchaseService.getProducts();
      // if (productList.isEmpty) {
      //   throw Exception('No products found. Check your product configuration.');
      // }
      // setState(() {
      //   products = productList;
      //   isLoading = false;
      // });
    } catch (e) {
      setState(() {
        isLoading = false;
        errorMessage = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: BoxDecoration(
        color: const Color(0xFFF5F7F8),
        borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
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
              width: 218.w,
              child: Text(
                AppStrings.takeFirstStep.tr,
                style: AppStyle.roboto12w400C090A0A,
                textAlign: TextAlign.center,
              ),
            ),
            Gap(20.h),
            if (isLoading)
              Container(
                height: 200.h,
                child: const Center(child: CircularProgressIndicator()),
              )
            else if (errorMessage != null)
              Container(
                height: 200.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error_outline, size: 48.sp, color: Colors.red),
                    Gap(16.h),
                    Text(
                      errorMessage!,
                      style: AppStyle.roboto14w400C090A0A,
                      textAlign: TextAlign.center,
                    ),
                    Gap(16.h),
                    TextButton(
                      onPressed: _loadProducts,
                      child: Text(
                        'Retry',
                        style: AppStyle.roboto14w700CFFD673,
                      ),
                    ),
                  ],
                ),
              )
            else ...[
              ...List.generate(products.length, (index) {
                final product = products[index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: PlanCard(
                    title: _getProductDisplayName(product),
                    price: product.price,
                    priceSuffix: _getPriceSuffix(product),
                    features: _getProductFeatures(product),
                    isHighlighted: selectedIndex == index,
                  ),
                );
              }),
              Gap(6.h),
              AppButton(
                text: AppStrings.subscribe.tr,
                onPressed: selectedIndex != null
                    ? () async {
                        // final selectedProduct = products[selectedIndex!];
                        // final success = await InAppPurchaseService.buyProduct(
                        //     selectedProduct);
                        // if (success) {
                        //   widget.onSubscribe(selectedProduct);
                        //   Navigator.of(context).pop();
                        // } else {
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //     SnackBar(
                        //       content: Text('Failed to initiate purchase'),
                        //       backgroundColor: Colors.red,
                        //     ),
                        //   );
                        // }
                      }
                    : null,
                width: 263.w,
                height: 48.h,
                backgroundColor: AppColors.primary,
                borderRadius: 30.r,
                textStyle: AppStyle.inter16w700CFFFFFF,
                enabled: selectedIndex != null,
              ),
              Gap(24.h),
              Text(
                AppStrings.pricingInfo.tr,
                style: AppStyle.inter12w400C090A0A,
                textAlign: TextAlign.center,
              ),
            ],
            Gap(16.h),
          ],
        ),
      ),
    );
  }

  String _getProductDisplayName(ProductDetails product) {
    if (product.id.contains('monthly')) {
      return 'Monthly Premium';
    } else if (product.id.contains('yearly')) {
      return 'Yearly Premium';
    }
    return product.title;
  }

  String _getPriceSuffix(ProductDetails product) {
    if (product.id.contains('monthly')) {
      return '/month';
    } else if (product.id.contains('yearly')) {
      return '/year';
    }
    return '';
  }

  List<String> _getProductFeatures(ProductDetails product) {
    return [
      'Premium features unlocked',
      'Full access to all features',
      'No ads',
      'Priority support',
    ];
  }
}

class PlanCard extends StatelessWidget {
  final String title;
  final String price;
  final String priceSuffix;
  final List<String> features;
  final bool isHighlighted;

  const PlanCard({
    super.key,
    required this.title,
    required this.price,
    required this.priceSuffix,
    required this.features,
    required this.isHighlighted,
  });

  @override
  Widget build(BuildContext context) {
    final borderColor =
        isHighlighted ? AppColors.yellowFFD673 : Colors.black.withAlpha(26);
    final backgroundColor = isHighlighted ? Colors.white : Colors.transparent;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
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
            title.tr,
            style: AppStyle.roboto16w500C090A0A,
          ),
          Gap(8.h),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: price,
                  style: AppStyle.roboto14w700CFFD673,
                ),
                TextSpan(
                  text: ' $priceSuffix',
                  style: AppStyle.roboto14w400C090A0A,
                ),
              ],
            ),
          ),
          Gap(12.h),
          ...features.map(
            (feature) => Padding(
              padding: EdgeInsets.only(bottom: 8.h),
              child: Row(
                children: [
                  Icon(
                    Icons.check_box_outlined,
                    color: const Color(0xFFFBC964),
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
// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/// The class represents the information of a product.
class ProductDetails {
  /// Creates a new product details object with the provided details.
  ProductDetails({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.rawPrice,
    required this.currencyCode,
    this.currencySymbol = '',
  });

  /// The identifier of the product.
  ///
  /// For example, on iOS it is specified in App Store Connect; on Android, it is specified in Google Play Console.
  final String id;

  /// The title of the product.
  ///
  /// For example, on iOS it is specified in App Store Connect; on Android, it is specified in Google Play Console.
  final String title;

  /// The description of the product.
  ///
  /// For example, on iOS it is specified in App Store Connect; on Android, it is specified in Google Play Console.
  final String description;

  /// The price of the product, formatted with currency symbol ("$0.99").
  ///
  /// For example, on iOS it is specified in App Store Connect; on Android, it is specified in Google Play Console.
  final String price;

  /// The unformatted price of the product, specified in the App Store Connect or Sku in Google Play console based on the platform.
  /// The currency unit for this value can be found in the [currencyCode] property.
  /// The value always describes full units of the currency. (e.g. 2.45 in the case of $2.45)
  final double rawPrice;

  /// The currency code for the price of the product.
  /// Based on the price specified in the App Store Connect or Sku in Google Play console based on the platform.
  final String currencyCode;

  /// The currency symbol for the locale, e.g. $ for US locale.
  ///
  /// When the currency symbol cannot be determined, the ISO 4217 currency code is returned.
  final String currencySymbol;
}
