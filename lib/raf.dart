// import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: ChartPage(),
//     );
//   }
// }

// class ChartPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Monthly User Growth'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: LineChart(
//           LineChartData(
//             gridData: FlGridData(
//                 show: true, horizontalInterval: 50, verticalInterval: 1),
//             titlesData: FlTitlesData(
//               leftTitles: SideTitles(showTitles: true, interval: 50),
//               bottomTitles: SideTitles(
//                   showTitles: true,
//                   interval: 1,
//                   getTitles: (value) {
//                     switch (value.toInt()) {
//                       case 0:
//                         return 'Jan';
//                       case 1:
//                         return 'Feb';
//                       case 2:
//                         return 'Mar';
//                       case 3:
//                         return 'Apr';
//                       case 4:
//                         return 'May';
//                       case 5:
//                         return 'Jun';
//                       default:
//                         return '';
//                     }
//                   }),
//             ),
//             borderData: FlBorderData(
//                 show: true, border: Border.all(color: Colors.black, width: 1)),
//             minX: 0,
//             maxX: 5,
//             minY: 0,
//             maxY: 300,
//             lineBarsData: [
//               LineChartBarData(
//                 spots: [
//                   FlSpot(0, 70), // Jan
//                   FlSpot(1, 100), // Feb
//                   FlSpot(2, 120), // Mar
//                   FlSpot(3, 170), // Apr
//                   FlSpot(4, 210), // May
//                   FlSpot(5, 280), // Jun
//                 ],
//                 isCurved: true,
//                 colors: [Colors.lightBlueAccent],
//                 belowBarData: BarAreaData(
//                     show: true,
//                     colors: [Colors.lightBlueAccent.withOpacity(0.2)]),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
