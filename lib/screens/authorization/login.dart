import 'package:ecommerce/screens/authorization/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../constants/controller_const.dart';
import '../../constants/colors.dart';
import '../../constants/images.dart';
import '../../utils/app_utils.dart';
import 'widgets/auth_widgets.dart';

class LoginView extends StatefulWidget {
  final String redirect;

  const LoginView({super.key, required this.redirect});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool _obscureText = false;



  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      extendBody:false,
      body: Center(
        child: Container(
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
          height: height,
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 68,
                child: commonBtn(
                    text: widget.redirect,
                    onTap: () {
                    }).paddingOnly(bottom: 20),
              ),
              commonTextField(
                hintText: "Email",
                controller: authController.loginEmailController,
                keyboardType: TextInputType.emailAddress,
                prefixIcon: const Icon(
                  Icons.mail,
                  color: Colors.grey,
                ),
              ),
              commonTextField(
                hintText: "Password",
                controller: authController.loginPasswordController,
                keyboardType: TextInputType.visiblePassword,
                prefixIcon: const Icon(
                  Icons.key,
                  color: Colors.grey,
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    _toggle();
                  },
                  color: Colors.grey,
                  icon: Icon(_obscureText
                      ? Icons.visibility_off
                      : Icons.visibility_outlined),
                ),
                obscureText: _obscureText,
              ),
              Obx(()=>
              authController.loading.value?
              showLoader().paddingOnly(top: 30):
              commonBtn(
                  text: "Login",
                  onTap: ()=>authController.loginBtn(redirect: widget.redirect))
                  .paddingOnly(top: 30),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "OR",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.anticSlab(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ).paddingSymmetric(vertical: 10),
              ),
              richTextWithForegroundColor(
                  text1: "Don't have account? ",
                  text2: "Signup",
                  onTap: () {
                    Get.to(() => SignupPage(redirect: widget.redirect));
                  }),
            ],
          ),


        ),
      ),
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
