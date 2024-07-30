


import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bindings/main_bindings.dart';
import 'constants/controller_const.dart';
import 'localization/langauge_localization.dart';
import 'screens/authorization/login.dart';

class Root extends StatelessWidget {
  const Root({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'VWeb',
      debugShowCheckedModeBanner: false,
      translations: Languages(),
      locale: languageController.currentLanguage,
      fallbackLocale: const Locale('en', 'Us'),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialBinding: MainBindings(),
      home: const LoginPage(),
    );
  }
}

