import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/controller_const.dart';
import '../../constants/colors.dart';
import '../../constants/images.dart';
import 'login.dart';
import 'signup.dart';
import 'widgets/auth_widgets.dart';

class MidScreen extends StatefulWidget {
  final String redirect;
  const MidScreen({super.key, required this.redirect});

  @override
  State<MidScreen> createState() => _MidScreenState();
}

class _MidScreenState extends State<MidScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: liteBlack,
          image: DecorationImage(
            isAntiAlias: true,
            image: AssetImage(imgLoginBg),
            fit: BoxFit.fill,
            //opacity: 0.8,
          ),
          borderRadius: BorderRadius.circular(0),
        ),
        width: double.infinity,
        height: Get.height,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              commonBtn(
                  text: "Login",
                  onTap: () {
                    authController.clearLoginControllers();
                    Get.to(() =>  LoginView(redirect: widget.redirect));
                  }).paddingOnly(bottom: 20),
              commonBtn(
                  text: "Sign up",
                  onTap: () {
                    authController.clearSignUpControllers();
                    Get.to(() =>  SignupPage(redirect: widget.redirect));
                  }),
            ],
          ),
        ),
      ),
    );
  }

}
