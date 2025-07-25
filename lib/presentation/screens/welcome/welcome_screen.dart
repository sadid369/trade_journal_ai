import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:trade_journal_ai/core/custom_assets/assets.gen.dart';
import 'package:trade_journal_ai/core/routes/route_path.dart';
import 'package:trade_journal_ai/helper/extension/base_extension.dart';
import 'package:trade_journal_ai/utils/text_style/text_style.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      // Navigate to the next screen after a delay
      context.go(RoutePath.home.addBasePath);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome back to',
              style: AppStyle.roboto18w4001D1B20H1,
            ),
            SizedBox(height: 8),
            Text(
              'Trade Journal AI',
              style: AppStyle.roboto24w5001D1B20H075,
            ),
            Gap(45.h),

            // Button 1: Track your trading journey
            Container(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.black,
                  width: 0.5,
                ),
                // Removed boxShadow for no elevation
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    Assets.icons.trackYourTradingJourney.path,
                    width: 24,
                    height: 24,
                  ),
                  SizedBox(width: 16),
                  Text(
                    'Track your trading journey',
                    style: AppStyle.roboto14w4001D1B20H121,
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),

            // Button 2: Pre-trade checklist
            Container(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.black,
                  width: 0.5,
                ),
                // Removed boxShadow for no elevation
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    Assets.icons.preTradeChecklist.path,
                    width: 24,
                    height: 24,
                  ),
                  SizedBox(width: 16),
                  Text(
                    'Pre-trade checklist',
                    style: AppStyle.roboto14w4001D1B20H121,
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),

            // Button 3: Improve trading discipline
            Container(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.black,
                  width: 0.5,
                ),
                // Removed boxShadow for no elevation
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    Assets.icons.improveTradingDiscipline.path,
                    width: 24,
                    height: 24,
                  ),
                  SizedBox(width: 16),
                  Text(
                    'Improve trading discipline',
                    style: AppStyle.roboto14w4001D1B20H121,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
