import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class LanguageController extends GetxController {
  static LanguageController instance = Get.find();

  late Box box1;

  late Locale currentLanguage;

  Rx<String> selectedLanguage = "ENG".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  changeLanguage(String newValue) {
    selectedLanguage(newValue);
    if (newValue == 'ENG') {
      Get.updateLocale(const Locale('en', 'Us'));
    }
    if (newValue == 'HIN') {
      Get.updateLocale(const Locale('hi_IN'));
    }
    setLanguage(newValue);
  }

  setLanguage(String language)  {
    box1.put('language', language);
    var language1 = box1.get('language');
    log(language1);
  }

  String getCurrentLanguage() {
    String currentLanguage1 = 'ENG';
    if (box1.get('language') != null) {
      if (box1.get('language') == 'ENG') {
        Get.updateLocale(const Locale('en', 'Us'));
        currentLanguage = const Locale('en', 'Us');
        currentLanguage1 = 'ENG';
      } else {
        Get.updateLocale(const Locale('hi_IN'));
        currentLanguage = const Locale('hi_IN');
        currentLanguage1 = 'HIN';
      }
    } else {
      Get.updateLocale(const Locale('en', 'Us'));
      currentLanguage = const Locale('en', 'Us');
      currentLanguage1 = 'ENG';
    }
    selectedLanguage(currentLanguage1);

    return currentLanguage1;
  }
}
