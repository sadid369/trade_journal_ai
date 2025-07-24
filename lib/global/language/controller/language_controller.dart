import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../helper/local_db/local_db.dart';
import '../../../utils/app_const/app_const.dart';
import '../eng/eng.dart';
import '../spanish/spanish.dart';

class Language extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "en_US": english,
        "es_ES": spanish,
      };
}

class LanguageController extends GetxController {
  final List<String> languages = ["English", "Spanish"];
  RxString selectedLanguage = "English".obs;

  @override
  void onInit() {
    super.onInit();
    getLanguageType();
  }

  Future<void> getLanguageType() async {
    String? lang = await SharedPrefsHelper.getString(AppConstants.language);

    if (lang == "Spanish") {
      selectedLanguage.value = "Spanish";
      Get.updateLocale(const Locale("es", "ES"));
    } else {
      selectedLanguage.value = "English";
      Get.updateLocale(const Locale("en", "US"));
    }
    update();
  }

  Future<void> changeLanguage(String lang) async {
    if (lang == "Spanish") {
      selectedLanguage.value = lang;
      Get.updateLocale(const Locale("es", "ES"));
      await SharedPrefsHelper.setString(AppConstants.language, "Spanish");
    } else {
      selectedLanguage.value = lang;
      Get.updateLocale(const Locale("en", "US"));
      await SharedPrefsHelper.setString(AppConstants.language, "English");
    }
    update();
  }
}
