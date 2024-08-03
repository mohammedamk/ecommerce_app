import 'dart:convert';
import 'package:ecommerce/screens/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/controller_const.dart';
import '../../../models/customers/address_model.dart';
import '../../../models/customers/orders/add_order_product_model.dart';
import '../../../models/customers/orders/orders_model.dart';
import '../../../utils/app_utils.dart';
import '../../constants/url_constant.dart';
import 'package:http/http.dart'as http;


class OrderController extends GetxController {
  static OrderController instance = Get.find();

  TextEditingController fullNameController     = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController houseNumberController  = TextEditingController();
  TextEditingController areaController         = TextEditingController();
  TextEditingController landmarkController     = TextEditingController();
  TextEditingController pincodeController      = TextEditingController();
  TextEditingController cityController         = TextEditingController();
  TextEditingController stateController        = TextEditingController();

  var selectAddressList = <AllAddress>[].obs;//       <--- this address list is created for to save and fetch the address
  var selectedAddress = <AllAddress>[].obs;//       <--- this selected address list is created for to save the selected address
  var myOrdersList = <OrderData>[].obs;
  var orderedProducts = <OrderedProducts>[].obs;
  var loading = false.obs;
  var paymentLoading = false.obs;


  /// ========================================= Buttons ======================================================

  void addAddressButton() {
    if (isValid()) {
      loading(true);
      AllAddress address = AllAddress(
        id: selectAddressList.length + 1,
        fullName: fullNameController.text,
        mobileNo: mobileNumberController.text,
        address:
            "${houseNumberController.text},${landmarkController.text},${areaController.text}",
        city: cityController.text,
        state: stateController.text,
        country: "India",
        pincode: pincodeController.text,
      );

      selectAddressList.add(address);
      if(selectedAddress.isNotEmpty){
        selectedAddress.clear();
        selectedAddress.add(address);

      }else{
        selectedAddress.add(address);
      }
      debugPrint(selectAddressList.toString());
      showToast(message: "Successfully added");
      loading(false);
      clearController();
      Get.back();
    }
  }


  /// ========================================= Methods ======================================================

  bool isValid() {
    if (fullNameController.text.isEmpty) {
      showToast(message: "Enter the full name");
      return false;
    }
    if (mobileNumberController.text.isEmpty) {
      showToast(message: "Enter the mobile number");
      return false;
    }
    if (mobileNumberController.text.length>10) {
      showToast(message: "mobile number must be 10 digits");
      return false;
    }
    if (houseNumberController.text.isEmpty) {
      showToast(message: "Enter the house");
      return false;
    }
    if (areaController.text.isEmpty) {
      showToast(message: "Enter the area");
      return false;
    }
    if (landmarkController.text.isEmpty) {
      showToast(message: "Enter the landmark");
      return false;
    }
    if (pincodeController.text.isEmpty) {
      showToast(message: "Enter the pincode");
      return false;
    }
    if (cityController.text.isEmpty) {
      showToast(message: "Enter the city");
      return false;
    }
    if (stateController.text.isEmpty) {
      showToast(message: "Enter the state");
      return false;
    }

    return true;
  }

  void clearController(){
    fullNameController.clear();
    mobileNumberController.clear();
    houseNumberController.clear();
    areaController.clear();
    landmarkController.clear();
    pincodeController.clear();
    cityController.clear();
    stateController.clear();
  }

  ///====================================== Api Integration ==================================================

  // Add Order
  addOrderApi() async {
    loading(true);

    var cartProducts = [];

    for (var product in cartController.cartProductList){
      cartProducts.add(OrderProduct(productId:int.parse(product.productId.toString()), adminId: int.parse(product.adminId.toString()), quantity: int.parse(product.quantity.toString())));
    }

    logger.d(cartProducts);

    await apiHelper.post(
      api: UrlConstant.addOrderApiUrl,
      body:  {
        "customer_id": dashboardController.customer.customerId.toString(),
        "customer_address": selectedAddress[0].address.toString(),
        "customer_name": selectedAddress[0].fullName.toString(),
        "mobile_number": selectedAddress[0].mobileNo.toString(),
        "city": selectedAddress[0].city.toString(),
        "state": selectedAddress[0].state.toString(),
        "country": selectedAddress[0].country.toString(),
        "pin_code": selectedAddress[0].pincode.toString(),
        "cart_products":cartProducts,
        "total_amount":cartController.totalAmount,
        "total_items":cartController.totalItems,
        "delivery_date":"2024-06-20",
      },
      onSuccess: ({required response}) async{
        loading(false);
        var obj = jsonDecode(response.body);
        logger.d(obj);
        if (obj['status'] == 'success') {
          await cartController.deleteCartApi(cartId: cartController.cartList[0].cartId.toString());
          Get.offAll(() => const DashBoardScreen(currentIndex: 0));
          showToast(message: "Order Has been Placed Successfully");
          // cartListApi();
        } else {
          showToast(message: obj['message']);
        }
      },
      onFailure: ({required message}) {
        loading(false);
        showToast(message: message);
      },
    );
  }

  // Order List By Customer Id
  orderListApi() async {
    loading(true);

    await apiHelper.get(
      api: "${UrlConstant.getMyOrdersApiUrl}/${dashboardController.customer.customerId}",
      body: {
      },
      onSuccess: ({required response}) {
        loading(false);
        var obj = jsonDecode(response.body);
        logger.d(obj);
        if (obj['status'] == 'success') {
          myOrdersList.clear();
          myOrdersList(OrdersModel.fromJson(obj).data);
          showToast(message: "Order successfully fetched");
        } else {
          showToast(message: obj['message']);
        }
      },
      onFailure: ({required message}) {
        loading(false);
        showToast(message: message);
      },
    );
  }


  // Order List by Admin Id
  orderListByAdminApi() async {
    loading(true);

    logger.d(adminDashboardController.admin.value.adminId);

    await apiHelper.get(
      api: "${UrlConstant.getAdminOrdersApiUrl}/${adminDashboardController.admin.value.adminId}",
      body: {
      },
      onSuccess: ({required response}) {
        loading(false);
        var obj = jsonDecode(response.body);
        logger.d(obj);
        if (obj['status'] == 'success') {
          myOrdersList.clear();
          myOrdersList(OrdersModel.fromJson(obj).data);
          showToast(message: "Order successfully fetched");
        } else {
          showToast(message: obj['message']);
        }
      },
      onFailure: ({required message}) {
        loading(false);
        showToast(message: message);
      },
    );
  }

  // update Order Status
  updateOrderStatusApi({required int orderId,required String orderStatus}) async {
    loading(true);

    await apiHelper.patch(
      api: UrlConstant.updateOrderStatusApiUrl,
      body:  {
        "order_id":orderId,
        "admin_id":adminDashboardController.admin.value.adminId.toString(),
        "order_status":orderStatus
      },
      onSuccess: ({required response}) async{
        loading(false);
        var obj = jsonDecode(response.body);
        logger.d(obj);
        if (obj['status'] == 'success') {
          showToast(message: "Order has been $orderStatus");
          orderListByAdminApi();

        } else {
          showToast(message: obj['message']);
        }
      },
      onFailure: ({required message}) {
        loading(false);
        showToast(message: message);
      },
    );
  }





  ///=====================================Stripe Integration===================================================

  createPaymentIntent(String amount, String currency) async {
    paymentLoading(true);
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card',
      };
      var secretKey = "sk_test_51NAov3CweVdGfueqm9YbcaqeqYJCNWT5gdpwv2PXqnZ2OHTDUhA0kRtz1RMfPKnq8V2BiXWGfRz8tTKo0QTM6hUm0043bPJ9IE";

      // var secretKey = "sk_test_51PKedGSIlncpQUtlS1MhF3GyZltRd4AhXiO3N4ntfkq8Tywt1bEfmDou8JcroWrJT6v6FUy7z0FYq8Po4SX8m5kI00NP04hFAa";
      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {'Authorization': 'Bearer $secretKey', 'Content-Type': 'application/x-www-form-urlencoded'},
        body: body,
      );
      debugPrint('Payment Intent Body: ${response.body.toString()}');
      paymentLoading(false);
      return jsonDecode(response.body.toString());
    } catch (err) {
      paymentLoading(false);
      debugPrint('Error charging user: ${err.toString()}');
    }
  }

  calculateAmount(String amount,) {
    final a = (int.parse(amount)) * 100;
    return a.toString();
  }

}
