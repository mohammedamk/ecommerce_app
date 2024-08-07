import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../constants/colors.dart';
import '../constants/controller_const.dart';
import '../widgets/widgets.dart';

Future<bool?> showToast({required String message}) {
  return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black45,
      textColor: Colors.white,
      fontSize: 16.0);
}

Widget showLoader({Color? color}) {
  return  Center(
      child: CircularProgressIndicator(
        color: color??primary,
        strokeWidth: 3,
      ));
}

bool isEmailValid(String em) {
  String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = RegExp(p);
  return regExp.hasMatch(em);
}

Future showLanguageAlertDialog(BuildContext context, Function onButtonPressed) {
  bool isWeb=GetPlatform.isWeb;
  double media=MediaQuery.of(context).size.width;
  AlertDialog alert =(isWeb && media>425)?
  AlertDialog(
    backgroundColor: white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    content: SizedBox(
        width: media/4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
                child:
                textWidget(text: 'select_lang'.tr),),
            const SizedBox(
              height: 20,
            ),
            Divider(
              color: secondary,
              height: 1,
            ),
            Obx(
                  () => RadioListTile(
                title:
                textWidget(text: 'str_english'.tr),
                groupValue: 'ENG',
                value: authController.languageValue.value,
                activeColor: primary,
                onChanged: (value) {
                  authController.languageValue('ENG');
                },
              ),
            ),
            Obx(() => RadioListTile(
              title:
              textWidget(text: 'str_hindi'.tr),
              groupValue: 'HIN',
              value: authController.languageValue.value,
              activeColor: primary,
              onChanged: (value) async {
                authController.languageValue('HIN');
              },
            )),
            const SizedBox(
              height: 20,
            ),
            filledButton(
                text: 'ok'.tr,
                onPressed: () {
                  languageController
                      .changeLanguage(authController.languageValue.value);
                  Get.back();
                },
              textColor: white,
              colorButton: primary, height: 45
                ),

          ],
        )),
  ):
  AlertDialog(
    backgroundColor: white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    content: SizedBox(
        width: media,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child:
              textWidget(text: 'select_lang'.tr),),
            const SizedBox(
              height: 20,
            ),
            Divider(
              color: secondary,
              height: 1,
            ),
            Obx(
                  () => RadioListTile(
                title:
                textWidget(text: 'str_english'.tr),
                groupValue: 'ENG',
                value: authController.languageValue.value,
                activeColor: primary,
                onChanged: (value) {
                  authController.languageValue('ENG');
                },
              ),
            ),
            Obx(() => RadioListTile(
              title:
              textWidget(text: 'str_hindi'.tr),
              groupValue: 'HIN',
              value: authController.languageValue.value,
              activeColor: primary,
              onChanged: (value) async {
                authController.languageValue('HIN');
              },
            )),
            const SizedBox(
              height: 20,
            ),
            filledButton(
                text: 'ok'.tr,
                onPressed: () {
                  languageController
                      .changeLanguage(authController.languageValue.value);
                  Get.back();
                },
                textColor: white,
                colorButton: primary, height: 45
            ),
          ],
        )),
  );
  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

String changeDateFormat(String date, String oldFormat, String newFormat) {
  String formattedDate = "";

  try {
    DateTime reqDate = DateFormat(oldFormat).parse(date);
    formattedDate = DateFormat(newFormat).format(reqDate);
  } catch (e) {
    debugPrint('error caught: $e');
  }
  return formattedDate;
}