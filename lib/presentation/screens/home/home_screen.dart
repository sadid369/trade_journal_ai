import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:trade_journal_ai/core/custom_assets/assets.gen.dart';
import 'package:trade_journal_ai/utils/app_colors/app_colors.dart';
import 'package:trade_journal_ai/utils/text_style/text_style.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Section
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
                        SizedBox(width: 10),
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
                SizedBox(height: 20),

                // Daily Performance Card
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.borderColor,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Daily Performance',
                        style: AppStyle.archivo20w5001D1B20,
                      ),
                      SizedBox(height: 10),
                      Text(
                        '+\$750',
                        style: AppStyle.roboto48w70080DFDB,
                      ),
                      SizedBox(height: 5),
                      Text(
                        '5 trades',
                        style: AppStyle.roboto16w500999999,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),

                // Grid Layout (4 Cards)
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1.3,
                    shrinkWrap: true,
                    children: [
                      _buildCard(
                        icon: Assets.icons.journalIcon.path,
                        title: 'Journal',
                      ),
                      _buildCard(
                        icon: Assets.icons.strategyHubIcon.path,
                        title: 'Strategy\nHub',
                      ),
                      _buildCard(
                        icon: Assets.icons.mindsetPsycologyIcon.path,
                        title: 'Mindset & Psychology',
                      ),
                      _buildCard(
                        icon: Assets.icons.routineIcon.path,
                        title: 'Routine',
                      ),
                      TradeSuccessRateWidget()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Function to build each card
Widget _buildCard({required String icon, required String title}) {
  return Container(
    padding: EdgeInsets.only(left: 20.w, top: 20.w),
    decoration: BoxDecoration(
      border: Border.all(
        color: AppColors.borderColor,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          icon,
          width: 37.w,
          height: 32.w,
        ),
        Gap(20.w),
        Text(
          title,
          style: AppStyle.roboto24w5001D1B20H104,
        ),
      ],
    ),
  );
}

// Custom Painter for the Progress Bar

class TradeSuccessRateWidget extends StatelessWidget {
  const TradeSuccessRateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300, // Or adjust as needed
      height: 150, // Or adjust as needed
      decoration: BoxDecoration(
        color: Colors
            .transparent, // Keeping the black background as in your initial image
        borderRadius: BorderRadius.circular(16), // More rounded corners
        border: Border.all(
          color: AppColors.borderColor,
          width: 1,
        ),
      ),
      child: Stack(
        children: [
          // LineChart for the curve
          Positioned.fill(
            // Make the chart fill the container
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 50.0), // Adjust padding to make space for text
              child: LineChart(
                LineChartData(
                  minX: 0,
                  maxX: 1,
                  minY: 0,
                  maxY: 1,
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        FlSpot(0, 0.2), // Start lower on the left
                        FlSpot(0.3, 0.4), // Control point 1
                        FlSpot(0.6, 0.9), // Peak
                        FlSpot(1, 0.5), // End point, slightly lower
                      ],
                      isCurved: true,
                      curveSmoothness: 0.2,
                      // The line itself is hidden by barWidth: 0, so its gradient doesn't matter visually.
                      // You can remove this gradient property if you strictly want no line.
                      gradient: LinearGradient(
                        colors: [
                          // These are for the line, which is currently hidden (barWidth: 0)
                          Colors
                              .transparent, // Making line gradient transparent if you want
                          Colors.transparent,
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      barWidth: 0, // Set barWidth to 0 to hide the line
                      isStrokeCapRound: true,
                      belowBarData: BarAreaData(
                        show: true,
                        // THIS IS WHERE THE CHART GRADIENT GOES
                        gradient: LinearGradient(
                          begin: Alignment.topCenter, // Corresponds to 180deg
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFF1100FE).withOpacity(
                                0.5), // #1100FE with some opacity for the area
                            Color(0xFFCDCDCD).withOpacity(
                                0.5), // #CDCDCD with some opacity for the area
                          ],
                        ),
                      ),
                    ),
                  ],
                  titlesData: FlTitlesData(
                    show: false,
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  gridData: FlGridData(
                    show: false,
                  ),
                  // Hide tooltips and interactions for a static display
                  lineTouchData: LineTouchData(enabled: false),
                ),
              ),
            ),
          ),

          // Text overlay
          Positioned(
            top: 16,
            left: 16,
            child: Text(
              'Trade Success Rate',
              style: TextStyle(
                color: Colors
                    .black, // Changed to white for better contrast on dark background
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 16,
            child: Text(
              '74%',
              style: TextStyle(
                color: Color(0xFF80DFDB), // Bright teal/cyan color
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
