import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';
import '../../constants/controller_const.dart';
import '../../constants/images.dart';
import '../../utils/app_utils.dart';
import 'login.dart';
import 'widgets/auth_widgets.dart';

class SignupPage extends StatefulWidget {
  final String redirect;
  const SignupPage({super.key, required this.redirect});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool _obscureText1 = false;
  bool _obscureText2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.lightBlue,
          image:  DecorationImage(
            image: AssetImage(imgLoginBg),
            fit: BoxFit.fill,
            //opacity: 0.8,
          ),
          borderRadius: BorderRadius.circular(0),
        ),
        width: double.infinity,
        height: Get.height,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                commonTextField(
                  hintText: "Full Name",
                  controller: authController.signupFullNameController,
                  keyboardType: TextInputType.text,
                  prefixIcon:   Icon(
                    Icons.person,
                    color: secondary,
                  ),
                ),
                Visibility(
                  visible: widget.redirect == "Admin",
                  child: commonTextField(
                    hintText: "Company Name",
                    controller: authController.signupCompanyNameController,
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: Icon(
                      Icons.home_repair_service_rounded,
                      color: secondary,
                    ),
                  ),
                ),
                commonTextField(
                  hintText: "Email",
                  controller: authController.signupEmailController,
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: Icon(
                    Icons.mail,
                    color: secondary,
                  ),
                ),
                commonTextField(
                  hintText: "Password",
                  controller: authController.signupPasswordController,
                  keyboardType: TextInputType.visiblePassword,
                  prefixIcon: Icon(
                    Icons.key,
                    color: secondary,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      _toggle1();
                    },
                    color: secondary,
                    icon: Icon(_obscureText1
                        ? Icons.visibility_off
                        : Icons.visibility_outlined),
                  ),
                  obscureText: _obscureText1,
                ),
                commonTextField(
                  hintText: "Confirm Password",
                  controller: authController.signupConfirmPassController,
                  keyboardType: TextInputType.visiblePassword,
                  prefixIcon: Icon(
                    Icons.key,
                    color: secondary,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      _toggle2();
                    },
                    color: secondary,
                    icon: Icon(_obscureText2
                        ? Icons.visibility_off
                        : Icons.visibility_outlined),
                  ),
                  obscureText: _obscureText2,
                ),

                Obx(()=>
                authController.loading.value?
                showLoader().paddingOnly(top: 30):
                commonBtn(text: "Sign Up", onTap: ()=>authController.signupBtn(redirect: widget.redirect))
                    .paddingOnly(top: 30),
                ),
                richTextWithForegroundColor(text1: "Already have account? ", text2: "Login", onTap: (){
                  Get.to(()=>LoginView(redirect: widget.redirect));
                }).paddingOnly(top: 10)
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _toggle1() {
    setState(() {
      _obscureText1 = !_obscureText1;
    });
  }

  void _toggle2() {
    setState(() {
      _obscureText2 = !_obscureText2;
    });
  }
}
