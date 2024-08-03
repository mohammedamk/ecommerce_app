
import 'dart:convert';
import 'package:get/get.dart';
import '../../../models/admin/products/products_model.dart';
import '../../../models/customers/cart/cart_model.dart';
import '../../../utils/app_utils.dart';
import '../../constants/controller_const.dart';
import '../../constants/url_constant.dart';

class CartController extends GetxController{
  static CartController instance = Get.find();

  var loading = false.obs;
  var cartList = <CartData>[].obs;
  var cartProductList = <AddedProducts>[].obs;
  var productList = <ProductData>[].obs;




  int get totalItems => cartProductList.fold(0, (sum, item) => (sum + (int.parse(item.quantity.toString()))));
  double get totalAmount => cartProductList.fold(0.0, (sum, model) {
    var price = double.tryParse(model.productDetails?.price.toString() ?? '0') ?? 0.0;
    var discountPercentage = double.tryParse(model.productDetails?.discountPercentage.toString() ?? '0') ?? 0.0;
    var quantity = double.tryParse(model. quantity!.toString()) ?? 0.0;
    return sum + ((price - ((price * discountPercentage) / 100)) * quantity);
  });

  double get totalSavings => cartProductList.fold(0.0, (sum, model) {
    var price = double.tryParse(model.productDetails?.price.toString() ?? '0') ?? 0.0;
    var discountPercentage = double.tryParse(model.productDetails?.discountPercentage.toString() ?? '0') ?? 0.0;
    var quantity = double.tryParse(model. quantity!.toString()) ?? 0.0;
    return sum + (((price * discountPercentage) / 100) * quantity);
  });


  // Add to Cart Button
  Future<void>addToCartBtn ({required String productId, required String adminId})async{
    await addProductToCartApi(productId: productId, adminId: adminId);
  }

  // Empty Cart Button
  Future<void>emptyCartBtn ({required String cartId,})async{
    await deleteCartApi(cartId: cartId,);
  }

  // Method to delete an item
  void deleteItem(int index) {
    cartProductList.removeAt(index);
  }

  // Delete Product from Cart Button
  Future<void>deleteCartProductBtn ({required String cartId, required String productId,required int index})async{
    cartController.deleteItem(index);
    await deleteCartProductApi(productId: productId, cartId: cartId);
  }

  // Increase Decrease Product in Cart Button
  Future<void>updateProductQuantityBtn ({required String productId, required String cartId,required String quantity})async{
    await updateQuantityOfProductInCart(productId: productId, cartId: cartId,quantity:quantity);
  }



  // Add Product to Cart Api
  addProductToCartApi({required String productId,required String adminId}) async {
    loading(true);

    await apiHelper.post(
      api: UrlConstant.addToCartApiUrl,
      body: {
        "customer_id": dashboardController.customer.customerId.toString(),
        "product_id":productId,
        "admin_id":adminId,
        "quantity":"1"
      },
      onSuccess: ({required response}) {
        loading(false);
        var obj = jsonDecode(response.body);
        logger.d(obj);

        if (obj['status'] == 'success') {
          showToast(message: "Product added to cart");
          cartListApi();
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



  // Cart List Api
  cartListApi() async {
    loading(true);

    await apiHelper.get(
      api: "${UrlConstant.getCartApiUrl}/${dashboardController.customer.customerId}",
      body: {
      },
      onSuccess: ({required response}) {
        loading(false);
        var obj = jsonDecode(response.body);
        logger.d(obj);

        if (obj['status'] == 'success') {
          clearValuesAndList();
          var obj = jsonDecode(response.body);
          if(obj['addedProducts'] != []){
            cartList.add(CartModel.fromJson(obj).data!);
            cartProductList(CartModel.fromJson(obj).data!.addedProducts);
            logger.d(jsonEncode(cartList[0]));
            logger.d(jsonEncode(cartProductList[0]));
            showToast(message: "cart fetched successfully");
          }
        } else {
          clearValuesAndList();
          showToast(message: obj['message']);
        }
      },
      onFailure: ({required message}) {
        loading(false);
        clearValuesAndList();
        showToast(message: message);
      },
    );
  }

  // clear Values
  clearValuesAndList(){
    cartList.clear();
    cartProductList.clear();
  }

  // delete cart product
  deleteCartProductApi({required String cartId,required String productId}) async {
    loading(true);

    await apiHelper.delete(
      api: UrlConstant.deleteCartProductApiUrl,
      body: {
        "customer_id":int.parse(dashboardController.customer.customerId.toString()),
        "cart_id":int.parse(cartId),
        "product_id":int.parse(productId),
        },
      onSuccess: ({required response}) {
        loading(false);
        var obj = jsonDecode(response.body);
        logger.d(obj);

        if (obj['status'] == 'success') {
          showToast(message: "product successfully deleted for cart");
          cartListApi();
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

  // delete cart product
  deleteCartApi({required String cartId}) async {
    loading(true);

    await apiHelper.delete(
      api: UrlConstant.deleteCartApiUrl,
      body: {
        "customer_id":int.parse(dashboardController.customer.customerId.toString()),
        "cart_id":int.parse(cartId),
      },
      onSuccess: ({required response}) {
        loading(false);
        var obj = jsonDecode(response.body);
        logger.d(obj);

        if (obj['status'] == 'success') {
          showToast(message: "cart deleted successfully");
          cartListApi();

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

  //update quantity of product in cart
  updateQuantityOfProductInCart({required String productId,required String cartId,required String quantity}) async {
    loading(true);
    logger.d(dashboardController.customer.customerId.toString());
    await apiHelper.patch(
      api: UrlConstant.updateCartProductQuantityApiUrl,
      body: {
        "customer_id": dashboardController.customer.customerId.toString(),
        "cart_id":cartId,
        "product_id":int.parse(productId),
        "quantity":quantity
      },
      onSuccess: ({required response}) {
        loading(false);
        var obj = jsonDecode(response.body);
        logger.d(obj);

        if (obj['status'] == 'success') {
          showToast(message: "product quantity update success fully");
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

}