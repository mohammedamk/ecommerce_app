import 'package:ecommerce/screens/dashboard/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:ecommerce/screens/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/controller_const.dart';
import '../../widgets/widgets.dart';
import '../admin/dashboard/dashboard.dart';
import '../authorization/front.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // authController.languageValue(languageController.selectedLanguage.value);
    // subscribeFcmTopic();
    _navigateToHome();
  }
  // subscribeFcmTopic() async{
  //   await FirebaseMessaging.instance.subscribeToTopic(UrlConstant.fcmTopic);
  // }
  _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 3), () async {
      String token = await authPreference.getToken();
      String userType = await authPreference.getType();
      debugPrint(token);
      if (token.isNotEmpty && userType.isNotEmpty) {
        if(userType == "Admin"){
          Get.offAll(()=>const AdminDashBoardScreen(currentIndex: 0));
        }else if(userType == "Customer"){
          Get.offAll(()=>const DashBoardScreen(currentIndex: 0));
          // Get.offAll(()=>const BottomNavBar());
        }else{
          Get.offAll(() =>  const FrontScreen());
        }
      } else {
        Get.offAll(() =>  const FrontScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 196,
                  height: 159,
                ),
              ),
            ),
            Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: Column(
                  children: [
                    textWidget(text: "MADE WITH \u2764️ IN INDIA").paddingOnly(bottom: 5),
                    textWidget(text: "Developed By Harsh Shambhuwani"),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
