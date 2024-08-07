
import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';

import '../../constants/controller_const.dart';
import '../../constants/url_constant.dart';
import '../../utils/app_utils.dart';

class CollectionsController extends GetxController{
  static CollectionsController instance = Get.find();

  var collectionsList = [].obs;
  var loading = false.obs;


  ///=================== Fetch All Collections ================
  fetchCollectionsApi({required String redirect}) async {
    loading(true);
    await apiHelper.get(
      api:
      redirect=="Admin"?
      "${UrlConstant.getAdminProductsApiUrl}/${adminDashboardController.admin.value.adminId}":UrlConstant.getProductsApiUrl,
      body: {},
      onSuccess: ({required response}) {
        loading(false);
        log(response.body);
        var obj = jsonDecode(response.body);
        if(obj['status']=='success'){
          log(obj.toString());
          collectionsList.clear();
          // collectionsList();

        }else{
          collectionsList.clear();

        }
      },
      onFailure: ({required message}) {
        loading(false);
        collectionsList.clear();
        showToast(message: message);
      },
    );
  }

  ///=================== Fetch All Collections ================
  addCollectionsApi({required String redirect}) async {
    loading(true);
    await apiHelper.get(
      api:
      redirect=="Admin"?
      "${UrlConstant.getAdminProductsApiUrl}/${adminDashboardController.admin.value.adminId}":UrlConstant.getProductsApiUrl,
      body: {},
      onSuccess: ({required response}) {
        loading(false);
        log(response.body);
        var obj = jsonDecode(response.body);
        if(obj['status']=='success'){
          log(obj.toString());
          collectionsList.clear();
          // collectionsList();

        }else{
          collectionsList.clear();

        }
      },
      onFailure: ({required message}) {
        loading(false);
        collectionsList.clear();
        showToast(message: message);
      },
    );
  }

  ///=================== Fetch All Collections ================
  editCollectionsApi({required String redirect}) async {
    loading(true);
    await apiHelper.get(
      api:
      redirect=="Admin"?
      "${UrlConstant.getAdminProductsApiUrl}/${adminDashboardController.admin.value.adminId}":UrlConstant.getProductsApiUrl,
      body: {},
      onSuccess: ({required response}) {
        loading(false);
        log(response.body);
        var obj = jsonDecode(response.body);
        if(obj['status']=='success'){
          log(obj.toString());
          collectionsList.clear();
          // collectionsList();

        }else{
          collectionsList.clear();

        }
      },
      onFailure: ({required message}) {
        loading(false);
        collectionsList.clear();
        showToast(message: message);
      },
    );
  }

  ///=================== Fetch All Collections ================
  deleteCollectionsApi({required String redirect}) async {
    loading(true);
    await apiHelper.get(
      api:
      redirect=="Admin"?
      "${UrlConstant.getAdminProductsApiUrl}/${adminDashboardController.admin.value.adminId}":UrlConstant.getProductsApiUrl,
      body: {},
      onSuccess: ({required response}) {
        loading(false);
        log(response.body);
        var obj = jsonDecode(response.body);
        if(obj['status']=='success'){
          log(obj.toString());
          collectionsList.clear();
          // collectionsList();

        }else{
          collectionsList.clear();

        }
      },
      onFailure: ({required message}) {
        loading(false);
        collectionsList.clear();
        showToast(message: message);
      },
    );
  }

}