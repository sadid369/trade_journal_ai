import 'package:get/get.dart';

import '../presentation/screens/auth/controller/auth_controller.dart';

import '../presentation/screens/home/controller/home_controller.dart';

import '../presentation/widgets/custom_navbar/navbar_controller.dart';

void initGetx() {
  // ================== Global Controller ==================

  // ================== Auth Controller ==================
  // Get.lazyPut(() => AuthController(), fenix: true);

  Get.lazyPut(() => HomeController(), fenix: true);

  // Get.lazyPut(() => SearchController(), fenix: true);

  // Get.lazyPut(() => ScannedItemsController(), fenix: true);

  // ================================= Worker ======================================

  // ================================= Client ======================================
}
