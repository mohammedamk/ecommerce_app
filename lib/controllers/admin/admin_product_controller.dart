// import 'dart:convert';
// import 'dart:developer';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import '../../../models/admin/products/ProductsModel.dart';
// import '../../../utils/app_utils.dart';
// import '../../constants/controller_const.dart';
// import '../../constants/url_constant.dart';
// import "package:http/http.dart" as http;
//
// class AdminProductController extends GetxController {
//   static AdminProductController instance = Get.find();
//
//   TextEditingController titleController = TextEditingController();
//   TextEditingController categoryController = TextEditingController();
//   TextEditingController priceController = TextEditingController();
//   TextEditingController discountController = TextEditingController();
//   TextEditingController stocksController = TextEditingController();
//   TextEditingController brandController = TextEditingController();
//   TextEditingController skuController = TextEditingController();
//   TextEditingController weightController = TextEditingController();
//   TextEditingController heightController = TextEditingController();
//   TextEditingController widthController = TextEditingController();
//   TextEditingController lengthController = TextEditingController();
//   TextEditingController warrantyController = TextEditingController();
//   TextEditingController shippingController = TextEditingController();
//   TextEditingController returnController = TextEditingController();
//   TextEditingController minQtyController = TextEditingController();
//   TextEditingController descriptionController = TextEditingController();
//   SearchController productSearchController = SearchController();
//   var searchText = "".obs;
//
//   var mediaFileList = <XFile>[].obs;
//   final ImagePicker _picker = ImagePicker();
//   var loading = false.obs;
//   var productList = <ProductData>[].obs;
//
//   RxList<ProductData> get filteredProductList {
//     final query = productSearchController.text.toLowerCase();
//     return productList
//         .where((item) => item.title.toString().toLowerCase().contains(query))
//         .toList()
//         .obs;
//   }
//
//   ///====================================== Buttons ===================================
//   addProductBtn({required String redirect}) {
//     if (isValid()) {
//       createProductApi(redirect: redirect);
//     }
//   }
//
//   ///===================================== Validation ===================================
//   Future<void> pickMultipleImages(RxList<XFile> list) async {
//     try {
//       List<XFile> selectedFiles = list;
//       selectedFiles = await _picker.pickMultiImage(requestFullMetadata: true);
//       list.addAll(selectedFiles);
//     } catch (e) {
//       // Handle any errors that might occur during picking media
//       debugPrint("Error picking media: $e");
//     }
//   }
//
//   bool isValid() {
//     if (titleController.text.isEmpty) {
//       showToast(message: "Enter Title");
//       return false;
//     }
//     if (categoryController.text.isEmpty) {
//       showToast(message: "Enter category");
//       return false;
//     }
//     if (priceController.text.isEmpty) {
//       showToast(message: "Enter price");
//       return false;
//     }
//     if (discountController.text.isEmpty) {
//       showToast(message: "Enter discount");
//       return false;
//     }
//     if (double.parse(discountController.text)>100 || double.parse(discountController.text)<0) {
//       logger.d(discountController);
//       showToast(message: "discount must be in range of 0 to 100 percent");
//       return false;
//     }
//     if (stocksController.text.isEmpty) {
//       showToast(message: "Enter stocks");
//       return false;
//     }
//     if (brandController.text.isEmpty) {
//       showToast(message: "Enter brand");
//       return false;
//     }
//     if (skuController.text.isEmpty) {
//       showToast(message: "Enter sku");
//       return false;
//     }
//     if (weightController.text.isEmpty) {
//       showToast(message: "Enter weight");
//       return false;
//     }
//     if (heightController.text.isEmpty) {
//       showToast(message: "Enter height");
//       return false;
//     }
//     if (widthController.text.isEmpty) {
//       showToast(message: "Enter width");
//       return false;
//     }
//     if (lengthController.text.isEmpty) {
//       showToast(message: "Enter length");
//       return false;
//     }
//     if (warrantyController.text.isEmpty) {
//       showToast(message: "Enter warranty");
//       return false;
//     }
//     if (shippingController.text.isEmpty) {
//       showToast(message: "Enter shipping information");
//       return false;
//     }
//     if (returnController.text.isEmpty) {
//       showToast(message: "Enter return policy");
//       return false;
//     }
//     if (minQtyController.text.isEmpty) {
//       showToast(message: "Enter minimum order quantity");
//       return false;
//     }
//     if (mediaFileList.isEmpty) {
//       showToast(message: "Add at-least one pic of the product");
//       return false;
//     }
//     if (descriptionController.text.isEmpty) {
//       showToast(message: "Enter desciption of the product");
//       return false;
//     }
//     if (mediaFileList.isEmpty) {
//       showToast(message: "Add at least one image of a product");
//       return false;
//     }
//     return true;
//   }
//
//   ///====================================== Methods ====================================
//   clearController() {
//     titleController.clear();
//     categoryController.clear();
//     priceController.clear();
//     discountController.clear();
//     stocksController.clear();
//     brandController.clear();
//     skuController.clear();
//     weightController.clear();
//     heightController.clear();
//     widthController.clear();
//     lengthController.clear();
//     warrantyController.clear();
//     shippingController.clear();
//     returnController.clear();
//     descriptionController.clear();
//     minQtyController.clear();
//     mediaFileList.clear();
//   }
//
//   ///================================== API Integration ================================
//
//   // =============== product list pagination ========================
//   // productListPagination() {
//   //   if (!bottomLoading.value) {
//   //     bottomLoading(true);
//   //
//   //     if(productController.productList.length ==
//   //         productController.totalProduct.value){
//   //       bottomLoading(true);
//   //
//   //     }
//   //     if (totalProduct.value > productList.length) {
//   //       page.value++;
//   //       limit.value += 6;
//   //       bottomLoading(true);
//   //       productController.productListApi(isFirstTime: false);
//   //     }
//   //   }
//   // }
//
//   // Product List API
//   productListApi({required String redirect}) async {
//     loading(true);
//     await apiHelper.get(
//       api:
//       redirect=="Admin"?
//           "${UrlConstant.getAdminProductsApiUrl}/${adminDashboardController.admin.value.adminId}":UrlConstant.getProductsApiUrl,
//       body: {},
//       onSuccess: ({required response}) {
//         loading(false);
//         log(response.body);
//         var obj = jsonDecode(response.body);
//         if(obj['status']=='success'){
//           log(obj.toString());
//           productList.clear();
//           productList(ProductsModel.fromJson(obj).data);
//
//         }else{
//           productList.clear();
//
//         }
//       },
//       onFailure: ({required message}) {
//         loading(false);
//         productList.clear();
//         showToast(message: message);
//       },
//     );
//   }
//
//   // Add Product Api
//   createProductApi({required String redirect}) async {
//     loading(true);
//
//     List<http.MultipartFile> fileList = [];
//     for (var file in mediaFileList) {
//       var multipartFile =
//           await http.MultipartFile.fromPath('products_images', file.path);
//       fileList.add(multipartFile);
//     }
//     await apiHelper.postMultiPartList(
//       api: UrlConstant.addProductApiUrl,
//       body: {
//         "admin_id": adminDashboardController.admin.value.adminId.toString(),
//         "title": titleController.text,
//         "description": descriptionController.text,
//         "category": categoryController.text,
//         "price": priceController.text,
//         "discount_precentage": discountController.text,
//         "stocks": priceController.text,
//         "brand": brandController.text,
//         "sku": skuController.text,
//         "weight": weightController.text,
//         "height": heightController.text,
//         "width": widthController.text,
//         "length": lengthController.text,
//         "warranty": warrantyController.text,
//         "shipping_info": shippingController.text,
//         "return_policy": returnController.text,
//         "is_product_image": "true"
//       },
//       path: fileList,
//       onSuccess: ({required response}) {
//         loading(false);
//         var obj = jsonDecode(response);
//         logger.d(obj);
//
//         if (obj['status'] == 'success') {
//           showToast(message: "Product successfully added");
//           Get.back();
//           productListApi(redirect: redirect);
//           clearController();
//         } else {
//           showToast(message: obj['message']);
//         }
//       },
//       onFailure: ({required message}) {
//         loading(false);
//         showToast(message: message);
//       },
//     );
//   }
//
//   // Delete Product Api
//   deleteProductApi({required String productId,required String redirect}) async {
//     loading(true);
//     await apiHelper.delete(
//       api:
//       "${UrlConstant.deleteProductApiUrl}/$productId",
//       body: {},
//       onSuccess: ({required response}) {
//         loading(false);
//         showToast(message: "Product successfully deleted");
//         productListApi(redirect: redirect);
//       },
//       onFailure: ({required message}) {
//         loading(false);
//         showToast(message: message);
//       },
//     );
//   }
//
//   // update Product Api
//   updateProductApi({required String productId,required String redirect}) async {
//     loading(true);
//
//     List<http.MultipartFile> fileList = [];
//     for (var file in mediaFileList) {
//       var multipartFile =
//       await http.MultipartFile.fromPath('products_images', file.path);
//       fileList.add(multipartFile);
//     }
//     await apiHelper.postMultiPartList(
//       api: UrlConstant.addProductApiUrl,
//       body: {
//         "admin_id": adminDashboardController.admin.value.adminId.toString(),
//         "product_id": productId,
//         "title": titleController.text,
//         "description": descriptionController.text,
//         "category": categoryController.text,
//         "price": priceController.text,
//         "discount_precentage": discountController.text,
//         "stocks": priceController.text,
//         "brand": brandController.text,
//         "sku": skuController.text,
//         "weight": weightController.text,
//         "height": heightController.text,
//         "width": widthController.text,
//         "length": lengthController.text,
//         "warranty": warrantyController.text,
//         "shipping_info": shippingController.text,
//         "return_policy": returnController.text,
//         "is_product_image": "true"
//       },
//       path: fileList,
//       onSuccess: ({required response}) {
//         loading(false);
//         var obj = jsonDecode(response);
//         logger.d(obj);
//
//         if (obj['status'] == 'success') {
//           showToast(message: "Product successfully added");
//           Get.back();
//           productListApi(redirect: redirect);
//           clearController();
//         } else {
//           showToast(message: obj['message']);
//         }
//       },
//       onFailure: ({required message}) {
//         loading(false);
//         showToast(message: message);
//       },
//     );
//   }
//
//
//
// }
