import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:trade_journal_ai/utils/app_colors/app_colors.dart';

import '../../../core/custom_assets/assets.gen.dart';
import '../../../utils/text_style/text_style.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage:
                            AssetImage(Assets.images.profilepic.path),
                      ),
                      Gap(10.w),
                      Text(
                        'Hello, Alex!',
                        style: AppStyle.roboto16w5001D1B20H112,
                      ),
                    ],
                  ),
                  SvgPicture.asset(
                    Assets.icons.notification.path,
                    width: 24.w,
                    height: 24.h,
                  ),
                ],
              ),
              Gap(20.w),
              Text(
                'Default Journal',
                style: AppStyle.archivo20w500BlackH090,
              ),
              Gap(20.h),

              // Stats Cards Row
              SizedBox(
                height: 110.h, // Adjust height as needed for your design
                child: Row(
                  children: [
                    Expanded(
                      child: _buildStatCard(
                        '5',
                        'Total\nTrades',
                        Colors.black,
                      ),
                    ),
                    Gap(12.w),
                    Expanded(
                      child: _buildStatCard(
                        '+\$750',
                        'P/L',
                        Colors.black,
                      ),
                    ),
                    Gap(12.w),
                    Expanded(
                      child: _buildStatCard(
                        '10%',
                        'Win Rate',
                        Colors.black,
                      ),
                    ),
                  ],
                ),
              ),

              Gap(30.h),

              // Statistics Section
              Text(
                'Statistic',
                style: AppStyle.archivo20w500BlackH090,
              ),
              Gap(16.h),

              // Chart Container
              Container(
                height: 200.h,
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: Offset(0, 2.h),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Legend
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        _buildLegendItem('Profit', Colors.green),
                        Gap(16.w),
                        _buildLegendItem('Loss', Colors.red),
                      ],
                    ),
                    Gap(16.h),
                    // Chart
                    Expanded(
                      child: BarChart(
                        BarChartData(
                          alignment: BarChartAlignment.spaceAround,
                          maxY: 100,
                          barTouchData: BarTouchData(enabled: false),
                          titlesData: FlTitlesData(
                            show: true,
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                getTitlesWidget: (value, meta) {
                                  const months = [
                                    'Jan',
                                    'Feb',
                                    'Mar',
                                    'Apr',
                                    'May',
                                    'Jun'
                                  ];
                                  if (value.toInt() < months.length) {
                                    return Text(
                                      months[value.toInt()],
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12.sp,
                                      ),
                                    );
                                  }
                                  return const Text('');
                                },
                                reservedSize: 30.h,
                              ),
                            ),
                            leftTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            topTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            rightTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                          ),
                          borderData: FlBorderData(show: false),
                          gridData: const FlGridData(show: false),
                          barGroups: [
                            _buildBarGroup(0, 40, 20), // Jan
                            _buildBarGroup(1, 30, 35), // Feb
                            _buildBarGroup(2, 25, 45), // Mar
                            _buildBarGroup(3, 45, 30), // Apr
                            _buildBarGroup(4, 60, 25), // May
                            _buildBarGroup(5, 80, 0), // Jun
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Gap(30.h),

              // Menu Items
              _buildMenuItem(
                Assets.icons.trackYourTradingJourney.path,
                'Trading journal',
                'View and analyze your trades',
              ),
              Gap(16.h),
              _buildMenuItem(
                Assets.icons.preTradeChecklist.path,
                'Strategy Hub',
                'Manage your trading strategy',
              ),
              Gap(16.h),
              _buildMenuItem(
                Assets.icons.routineIcon.path,
                'Routine Tracker',
                'View your trading routine',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(String value, String label, Color valueColor) {
    return Container(
      height: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: AppColors.borderColor, // <-- Add this line for border color
          width: 1, // You can adjust the width as needed
        ),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey.withOpacity(0.1),
        //     spreadRadius: 1,
        //     blurRadius: 10,
        //     offset: Offset(0, 2.h),
        //   ),
        // ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: valueColor,
            ),
          ),
          Gap(4.h),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.grey,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLegendItem(String label, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const Gap(6),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  BarChartGroupData _buildBarGroup(int x, double profit, double loss) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: profit + loss,
          color: Colors.transparent,
          width: 20,
          borderRadius: BorderRadius.circular(1.r),
          rodStackItems: [
            BarChartRodStackItem(0, loss, Colors.red),
            BarChartRodStackItem(loss, profit + loss, Colors.green),
          ],
        ),
      ],
    );
  }

  Widget _buildMenuItem(String icon, String title, String subtitle) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: Row(
        children: [
          // Container(
          //   padding: EdgeInsets.all(8.w),
          //   decoration: BoxDecoration(
          //     color: Colors.grey[100],
          //     borderRadius: BorderRadius.circular(8.r),
          //   ),
          //   child: Icon(
          //     icon,
          //     size: 24.w,
          //     color: Colors.black,
          //   ),
          // ),
          SvgPicture.asset(icon, width: 24.w, height: 24.h),
          Gap(16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                Gap(4.h),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.chevron_right,
            color: Colors.grey,
            size: 24.w,
          ),
        ],
      ),
    );
  }
}
