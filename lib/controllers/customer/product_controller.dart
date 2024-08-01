
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/controller_const.dart';
import '../../constants/url_constant.dart';
import '../../helpers/api_helper.dart';
import '../../models/customers/ProductsModel.dart';
import '../../utils/app_utils.dart';
class ProductController extends GetxController{
  static ProductController instance = Get.find();


  var productList = <Products>[].obs;
  var cartList = <Products>[].obs;
  var loading = false.obs;
  var addPostLoading = false.obs;
  var bottomLoading = false.obs;
  var totalProduct=36.obs;
  var page = 1.obs;
  var limit = 6.obs;
  final ScrollController packageListScrollController = ScrollController();
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  SearchController productSearchController = SearchController();

  //==================================== Product List API =============================
  int get totalItems => cartList.fold(0, (sum, item) => sum + (int.parse(item.quantity!.value.toString())));
  double get totalAmount => cartList.fold(0.0, (sum, model) => sum + ((double.parse(model.price.toString()) - ((double.parse(model.price.toString()) * double.parse(model.discountPercentage.toString())) / 100)) * double.parse(model.quantity!.value.toString())));
  double get totalSavings => cartList.fold(0.0, (sum, model) => sum + (((double.parse(model.price.toString()) * double.parse(model.discountPercentage.toString())) / 100) * double.parse(model.quantity!.value.toString())));


  ///===================================== API =====================================

  //==================================== Product List API =============================


  // =============== product list pagination ========================
  productListPagination() {
    if (!bottomLoading.value) {
      bottomLoading(true);

      if(productList.length ==
          totalProduct.value){
        bottomLoading(true);

      }
      if (totalProduct.value > productList.length) {
        page.value++;
        limit.value *= page.value;
        bottomLoading(true);
        productListApi(isFirstTime: false);
      }
    }
  }

  productListApi({bool? isFromRefresh, required bool isFirstTime}) async {
    if (isFromRefresh != true && bottomLoading.value != true) {
      loading(true);
    }
    if (isFirstTime == true) {
      page.value = 1;
      limit.value = 6;
    }
    await apiHelper.get(
      api: "${UrlConstant.productListUrl}?limit=${limit.value}",
      body: {},
      onSuccess: ({required response}) {
        loading(false);
        log(response.body);
        var obj = jsonDecode(response.body);
        log(obj.toString());
        if (isFirstTime == true) {
          productList.clear();
          productList(ProductsModel.fromJson(obj).products);
        }else{
          productList(ProductsModel.fromJson(obj).products);
        }
        // PostModel model = PostModel.fromJson(obj);
        // totalPost = model.data?.length;

        bottomLoading(false);
        return productList;
      },
      onFailure: ({required message}) {
        loading(false);
        bottomLoading(false);
        showToast(message: message);
      },
    );
  }

  // Method to delete an item
  void deleteItem(int index) {
    cartList.removeAt(index);
  }


}