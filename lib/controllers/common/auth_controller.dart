import 'dart:convert';
import 'package:ecommerce/screens/dashboard/dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../models/admin/auth/admin_user_model.dart';
import '../../../models/customers/auth/customer_user_model.dart';
import '../../../utils/app_utils.dart';
import '../../constants/controller_const.dart';
import '../../constants/url_constant.dart';
import '../../screens/admin/dashboard/dashboard.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  TextEditingController signupEmailController = TextEditingController();
  TextEditingController signupFullNameController = TextEditingController();
  TextEditingController signupCompanyNameController = TextEditingController();
  TextEditingController signupPasswordController = TextEditingController();
  TextEditingController signupConfirmPassController = TextEditingController();

  var loading = false.obs;
  var languageValue = 'ENG'.obs;

  ///====================================== Buttons ======================================

  // login button
  Future<void> loginBtn({required String redirect}) async{
    if (isLoginValid()) {
      await loginApi(redirect: redirect);
    }
  }

  // signup button
  void signupBtn({required String redirect}) async {
    if (isRegValid(redirect: redirect)) {
      signupApi(redirect: redirect);
    }
  }

  ///=================================== Methods ===========================================

  // clear login controller
  clearLoginControllers() {
    loginEmailController.clear();
    loginPasswordController.clear();
  }

  // clear signup controller
  clearSignUpControllers() {
    signupFullNameController.clear();
    signupCompanyNameController.clear();
    signupEmailController.clear();
    signupPasswordController.clear();
    signupConfirmPassController.clear();
  }

  ///====================================== Validation ======================================
  // login validation
  bool isLoginValid() {
    if (loginEmailController.text.isEmpty) {
      showToast(message: "Please enter email");
      return false;
    }
    if (!isEmailValid(loginEmailController.text)) {
      showToast(message: "Please enter email correctly");
      return false;
    }
    if (loginPasswordController.text.isEmpty) {
      showToast(message: "Please enter password");
      return false;
    }
    if (loginPasswordController.text.length < 6) {
      showToast(message: "Password must be greater than 5 digit");
      return false;
    }
    return true;
  }

  // admin validation
  bool isRegValid({required String redirect}) {
    if (signupFullNameController.text.isEmpty) {
      showToast(message: "Please enter email");
      return false;
    }
    if (redirect == "Admin" && signupCompanyNameController.text.isEmpty) {
      showToast(message: "Please enter email");
      return false;
    }
    if (signupEmailController.text.isEmpty) {
      showToast(message: "Please enter email");
      return false;
    }
    if (!isEmailValid(signupEmailController.text)) {
      showToast(message: "Please enter email correctly");
      return false;
    }
    if (signupPasswordController.text.isEmpty) {
      showToast(message: "Please enter password");
      return false;
    }
    if (signupPasswordController.text.length < 6) {
      showToast(message: "Password must be greater than 5 digit");
      return false;
    }
    if (signupConfirmPassController.text.isEmpty) {
      showToast(message: "Please enter confirm password");
      return false;
    }
    if (signupConfirmPassController.text != signupPasswordController.text) {
      showToast(message: "Password doesn't match");
      return false;
    }
    return true;
  }

  /// ======================================= API Integration ==================================

  // login
  loginApi({required String redirect}) async {
    loading(true);
    await apiHelper.post(
      api: UrlConstant.loginApiUrl,
      body: {
        'email': loginEmailController.text,
        'password': loginPasswordController.text,
        'userType': redirect
      },
      onSuccess: ({required response}) {
        loading(false);
        var obj = jsonDecode(response.body);
        logger.d(obj);
        if(obj['status']=='Success'){
          authPreference.saveUserToken(token: obj['token']);
          authPreference.saveUserType(userType: redirect);
        }
        if (redirect == "Admin") {
          if(obj['status']=='Success'){
            AdminData model = AdminData.fromJson(obj['data']);
            authPreference.saveAdminUserModel(model: model);
            showToast(message: "Successfully Logged In in Admin");
            Get.offAll(() => const AdminDashBoardScreen(currentIndex: 0));
            clearLoginControllers();
          }else{
            showToast(message: obj['message']);
          }
        } else if (redirect == "Customer") {
          if(obj['status']=='Success'){
            CustomerData model = CustomerData.fromJson(obj['data']);
            authPreference.saveCustomerUserModel(model: model);
            showToast(message: "Successfully Logged In in Customer");
            Get.offAll(() => const DashBoardScreen(
                currentIndex: 0
            ));
            clearLoginControllers();
          }else{
            showToast(message: obj['message']);

          }
        } else {
          showToast(message: "Something went wrong");
        }
      },
      onFailure: ({required message}) {
        loading(false);
        showToast(message: message);
      },
    );
  }

  // Signup
  signupApi({required String redirect}) async {
    loading(true);
    await apiHelper.post(
      api: UrlConstant.signUpApiUrl,
      body: redirect == "Admin"
          ? {
              'full_name': signupFullNameController.text,
              'company_name': signupCompanyNameController.text,
              'email': signupEmailController.text,
              'password': signupPasswordController.text,
              'userType': redirect
            }
          : {
              'full_name': signupFullNameController.text,
              'email': signupEmailController.text,
              'password': signupPasswordController.text,
              'userType': redirect
            },
      onSuccess: ({required response}) {
        loading(false);
        var obj = jsonDecode(response.body);
        logger.d(obj);
        if (redirect == "Admin") {
          showToast(message: "Successfully Signed Up in Admin");
          Get.offAll(() => const AdminDashBoardScreen(currentIndex: 0));
        } else if (redirect == "Customer") {
          showToast(message: "Successfully Signed Up in Customer");
          Get.offAll(() => const DashBoardScreen(currentIndex: 0));
        } else {
          showToast(message: "Something went wrong");
        }
      },
      onFailure: ({required message}) {
        loading(false);
        showToast(message: message);
      },
    );
  }
}
