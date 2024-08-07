import 'dart:convert';
import 'dart:developer';

import 'package:ecommerce/models/collections/collection_details_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../constants/controller_const.dart';
import '../../constants/url_constant.dart';
import '../../models/collections/collection_model.dart';
import '../../utils/app_utils.dart';

class CollectionsController extends GetxController {
  static CollectionsController instance = Get.find();

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  var collectionsList = <CollectionsData>[].obs;
  var loading = false.obs;
  var deleteLoading = false.obs;
  var isProductSelected = false.obs;
  var isEditMode = false.obs;
  var collectionModel = CollectionDetailsData().obs;
  var collectionProductList = <CollectionsProducts>[].obs;
  var selectedProductsIds = [];

  ///========================================= Buttons ========================================

  Future<void> addButton() async {
    if (isValid()) {
      await addCollectionsApi();
    }
  }


  Future<void> editButton({required String collectionId,required bool isComingFromDetails}) async {
    if (isValid()) {
      await editCollectionsApi(collectionId: collectionId, isComingFromDetails: isComingFromDetails);
    }
  }

  Future<void> deleteButton({required String collectionId}) async {
    await deleteCollectionsApi(collectionId: collectionId);
  }



  ///======================================== Functions ========================================

  bool isValid() {
    if (titleController.text.isEmpty) {
      showToast(message: "Enter the title");
      return false;
    }
    if (descriptionController.text.isEmpty) {
      showToast(message: "Enter the title");
      return false;
    }
    return true;
  }


  clearController() {
    titleController.clear();
    descriptionController.clear();
  }

  ///=========================================== API ========================================
  ///=================== Fetch All Collections ================
  fetchCollectionsApi() async {
    loading(true);
    await apiHelper.get(
      api: UrlConstant.collectionApiUrl,
      body: {},
      onSuccess: ({required response}) {
        loading(false);
        log(response.body);
        var obj = jsonDecode(response.body);
        if (obj['status'] == 'success') {
          log(obj.toString());
          collectionsList.clear();
          collectionsList(CollectionsModels.fromJson(obj).data);
        } else {
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

  ///=================== Fetch Collection Details ================
  fetchCollectionDetailsApi({required String collectionId}) async {
    loading(true);
    await apiHelper.get(
      api: "${UrlConstant.collectionApiUrl}/$collectionId",
      body: {},
      onSuccess: ({required response}) {
        log(response.body);
        var obj = jsonDecode(response.body);
        if (obj['status'] == 'success') {
          log(obj.toString());
          isEditMode(false);
          collectionModel(CollectionDetailsModel.fromJson(obj).data);
          titleController.text = collectionModel.value.title.toString();
          descriptionController.text = collectionModel.value.description.toString();
          collectionProductList(collectionModel.value.products);
          selectedProductsIds.clear();
          for (var product in adminProductController.productList) {
            var collectionProduct = collectionProductList.firstWhere(
                  (element) => element.id == product.id,
              orElse: () => CollectionsProducts(), // Provide a default instance of CollectionsProducts
            );

            if (collectionProduct.id == product.id) {
              product.setIsSelected = true.obs;
              selectedProductsIds.add(collectionProduct.id.toString());
            } else {
              product.setIsSelected = false.obs;
            }
          }
          loading(false);
        } else {
          loading(false);

        }
      },
      onFailure: ({required message}) {
        loading(false);
        collectionsList.clear();
        showToast(message: message);
      },
    );
  }

  ///=================== Add Collection ================
  addCollectionsApi() async {
    loading(true);
    await apiHelper.post(
      api: UrlConstant.collectionApiUrl,
      body: {
        "admin_id": adminDashboardController.admin.value.adminId,
        "title": titleController.text,
        "handle": titleController.text,
        "description": descriptionController.text
      },
      onSuccess: ({required response}) {
        loading(false);
        log(response.body);
        var obj = jsonDecode(response.body);
        if (obj['status'] == 'success') {
          log(obj.toString());
          showToast(message: obj['message']);
          fetchCollectionsApi();
          Get.back();
          clearController();
        } else {
          loading(false);
        }
      },
      onFailure: ({required message}) {
        loading(false);
        showToast(message: message);
      },
    );
  }

  ///=================== Update Collection ================
  editCollectionsApi({required String collectionId,required bool isComingFromDetails}) async {
    loading(true);
    await apiHelper.put(
      api: UrlConstant.collectionApiUrl,
      body: {
        "collection_id":collectionId,
        "admin_id":adminDashboardController.admin.value.adminId,
        "title":titleController.text,
        "handle":titleController.text,
        "description":descriptionController.text,
        "products":selectedProductsIds
      },
      onSuccess: ({required response}) {
        loading(false);
        log(response.body);
        var obj = jsonDecode(response.body);
        if (obj['status'] == 'success') {
          log(obj.toString());
          collectionProductList.clear();
          fetchCollectionDetailsApi(collectionId: collectionId);
          if(!isComingFromDetails){
            collectionsController.isEditMode(false);
            Get.back();
          }

        } else {
        }
      },
      onFailure: ({required message}) {
        loading(false);
        showToast(message: message);
      },
    );
  }

  ///=================== Remove Collection Collections ================
  deleteCollectionsApi({required String collectionId}) async {
    loading(true);
    await apiHelper.get(
      api: "${UrlConstant.collectionApiUrl}/$collectionId",
      body: {},
      onSuccess: ({required response}) {
        loading(false);
        log(response.body);
        var obj = jsonDecode(response.body);
        if (obj['status'] == 'success') {
          log(obj.toString());
        } else {
        }
      },
      onFailure: ({required message}) {
        loading(false);
        showToast(message: message);
      },
    );
  }

  ///=================== Remove Product from Collection ================
  deleteCollectionProductApi({required String collectionId,required String productId,required int index}) async {
    deleteLoading(true);
    await apiHelper.delete(
      api: "${UrlConstant.collectionApiUrl}/products/$collectionId/$productId",
      body: {},
      onSuccess: ({required response}) {
        deleteLoading(false);
        log(response.body);
        var obj = jsonDecode(response.body);
        if (obj['status'] == 'success') {
          log(obj.toString());
          showToast(message: obj['message']);
          collectionProductList.removeAt(index);
          for (var product in adminProductController.productList) {
            var collectionProduct = collectionProductList.firstWhere(
                  (element) => element.id == product.id,
              orElse: () => CollectionsProducts(), // Provide a default instance of CollectionsProducts
            );

            if (collectionProduct.id == product.id) {
              product.setIsSelected = true.obs;
              // selectedProductsIds.add(collectionProduct.id.toString());
            } else {
              product.setIsSelected = false.obs;
            }
          }
        } else {

        }
      },
      onFailure: ({required message}) {
        deleteLoading(false);
        showToast(message: message);
      },
    );
  }


}
