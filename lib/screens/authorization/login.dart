import 'package:ecommerce/screens/authorization/forgot_password.dart';
import 'package:ecommerce/screens/authorization/signup.dart';
import 'package:ecommerce/screens/dashboard/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Color primary = const Color(0xff105dfb);
Color primaryBackground = const Color(0xfff6f6f6);
Color primaryText = const Color(0xff12151c);
Color tertiary = const Color(0xffee8b60);
Color alternate = const Color(0xffE0E3E7);
Color error = const Color(0xffe65454);
Color secondaryText = const Color(0xff5a5c60);

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var isPasswordVisible = true.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: // Generated code for this scrollingContainer Widget...
          Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            flex: 6,
            child: Container(
              width: 100,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [primary, tertiary],
                  stops: const [0, 1],
                  begin: const AlignmentDirectional(0.87, -1),
                  end: const AlignmentDirectional(-0.87, 1),
                ),
              ),
              alignment: const AlignmentDirectional(0, -1),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 70, 0, 32),
                      child: Container(
                        width: 286,
                        height: 68,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        alignment: const AlignmentDirectional(0, 0),
                        child: const Text(
                          'ECOMMERCE',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Readex Pro',
                            color: Colors.white,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Container(
                        width: double.infinity,
                        constraints: const BoxConstraints(
                          maxWidth: 570,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 4,
                              color: Color(0x33000000),
                              offset: Offset(
                                0,
                                2,
                              ),
                            )
                          ],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Align(
                          alignment: const AlignmentDirectional(0, 0),
                          child: Padding(
                            padding: const EdgeInsets.all(32),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 12, 0, 24),
                                  child: Text(
                                    'Let\'s get started by filling out the form below.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0,
                                    ),
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 16),
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: TextFormField(
                                      // controller: _model.emailAddressTextController,
                                      // focusNode: _model.emailAddressFocusNode,
                                      autofocus: true,
                                      // autofillHints: [AutofillHints.email],
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Email',
                                        labelStyle: const TextStyle(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0xfff6f6f6),
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: primary,
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: alternate,
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: alternate,
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        filled: true,
                                        fillColor: primaryBackground,
                                      ),
                                      style: const TextStyle(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0,
                                      ),
                                      keyboardType: TextInputType.emailAddress,
                                      // validator: _model.emailAddressTextControllerValidator
                                      //     .asValidator(context),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 16),
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: Obx(()=> TextFormField(
                                        // controller: _model.passwordTextController,
                                        // focusNode: _model.passwordFocusNode,
                                        autofocus: true,

                                        // autofillHints: [AutofillHints.password],
                                        obscureText: isPasswordVisible.value
                                        ,
                                        decoration: InputDecoration(
                                          labelText: 'Password',
                                          labelStyle: const TextStyle(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0,
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: primaryBackground,
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: primary,
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: error,
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          focusedErrorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: error,
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          filled: true,
                                          fillColor: primaryBackground,
                                          suffixIcon: InkWell(
                                            onTap: () {
                                              if(isPasswordVisible.value){
                                                isPasswordVisible.value = false;
                                              }else{
                                                isPasswordVisible.value = true;
                                              }
                                            },
                                            focusNode:
                                                FocusNode(skipTraversal: true),
                                            child: Icon(
                                              // _model.passwordVisibility
                                              //     ? Icons.visibility_outlined
                                              //     : Icons.visibility_off_outlined,
                                              Icons.visibility_off_outlined,
                                              color: secondaryText,
                                              size: 24,
                                            ),
                                          ),
                                        ),
                                        style: const TextStyle(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0,
                                        ),
                                        // validator: _model.passwordTextControllerValidator
                                        //     .asValidator(context),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 16),
                                  child: SizedBox(
                                    width: double.infinity,
                                    height: 44,
                                    child: TextButton(
                                      onPressed: () {
                                        Get.to(()=>const BottomNavBar());
                                      },
                                      style: ButtonStyle(

                                        padding: const WidgetStatePropertyAll(
                                            EdgeInsetsDirectional.fromSTEB(
                                                0, 0, 0, 0)),
                                        backgroundColor:
                                            WidgetStateProperty.all(primary),
                                        textStyle: const WidgetStatePropertyAll(
                                            TextStyle(
                                          fontFamily: 'Inter',
                                          color: Colors.white,
                                          letterSpacing: 0,
                                        )),
                                        elevation: WidgetStateProperty.all(3),
                                        shape: WidgetStateProperty.all(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            side: const BorderSide(
                                              color: Colors.teal,
                                              width: 1,
                                            ),
                                          ),
                                        ),
                                      ),
                                      child: const Text(
                                        "Login",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                                 Align(
                                  alignment: Alignment.centerRight,
                                  child: InkWell(
                                    onTap: (){
                                      Get.to(()=>const ForgotPasswordPage());
                                    },
                                    child: const Text(
                                      'forgot password',
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0,
                                      ),
                                    ),
                                  ),
                                ).paddingOnly(bottom: 10,right: 10),
                                const Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 0, 16, 24),
                                  child: Row(
                                    children: [
                                      Expanded(child: Divider(color: Colors.grey,)),
                                      Text(
                                        'OR    ',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontFamily: 'Inter',
                                          letterSpacing: 0,
                                        ),
                                      ),
                                      Expanded(child: Divider(color: Colors.grey,)),

                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 16),
                                  child: SizedBox(
                                    width: double.infinity,
                                    height: 44,
                                    child: TextButton(
                                      onPressed: () {},
                                      style: ButtonStyle(
                                        padding: const WidgetStatePropertyAll(
                                            EdgeInsetsDirectional.fromSTEB(
                                                0, 0, 0, 0)),
                                        backgroundColor:
                                            WidgetStateProperty.all(
                                                Colors.white),
                                        textStyle: WidgetStatePropertyAll(
                                          TextStyle(
                                            fontFamily: 'Inter',
                                            color: primaryText,
                                            letterSpacing: 0,
                                          ),
                                        ),
                                        shape: WidgetStateProperty.all(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            side: BorderSide(
                                              color: alternate,
                                              width: 2,
                                            ),
                                          ),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            "assets/images/img_google.png",
                                            height: 20,
                                            width: 20,
                                          ).paddingOnly(right: 10),
                                          const Text('Continue with Google'),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 16),
                                  child: SizedBox(
                                    width: double.infinity,
                                    height: 44,
                                    child: TextButton(
                                      onPressed: () {},
                                      style: ButtonStyle(
                                        padding: const WidgetStatePropertyAll(
                                            EdgeInsetsDirectional.fromSTEB(
                                                0, 0, 0, 0)),
                                        backgroundColor:
                                            WidgetStateProperty.all(
                                                Colors.white),
                                        textStyle: WidgetStatePropertyAll(
                                          TextStyle(
                                            fontFamily: 'Inter',
                                            color: primaryText,
                                            letterSpacing: 0,
                                          ),
                                        ),
                                        shape: WidgetStateProperty.all(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            side: BorderSide(
                                              color: alternate,
                                              width: 2,
                                            ),
                                          ),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,

                                        children: [
                                          Image.asset(
                                            "assets/images/img_apple_logo.png",
                                            height: 20,
                                            width: 20,
                                          ).paddingOnly(right: 10),
                                          const Text('Continue with Apple'),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: (){
                                    Get.to(()=>const SignupPage());
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                    const Text(
                                       'Don\'t have an account?  ',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    Text(
                                      'Sign Up here',
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        color: primary,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  ],),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
