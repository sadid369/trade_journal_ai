import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import 'dart:async';
import 'package:get/get.dart';

import '../../../core/routes/route_path.dart';
import '../../../helper/local_db/local_db.dart';
import '../../../utils/static_strings/static_strings.dart';
import '../../widgets/custom_bottons/custom_button/app_button.dart';
import '../../widgets/subscription_modal/subscription_modal.dart';
import '../../../global/model/contact.dart';
import '../../../service/contact_api_service.dart';

import 'controller/home_controller.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Text('Home Screen'),
      ),
    );
  }
}
