import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'constants/controller_const.dart';
import 'root.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter(); // Initialize Hive
  languageController.box1 = await Hive.openBox('getLanguage');
  languageController.getCurrentLanguage();
  runApp(const Root());
}

