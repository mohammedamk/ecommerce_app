

class UrlConstant{

  //Production
  // static const String baseUrl = 'https://jsonplaceholder.typicode.com';
  static const String baseUrl = 'https://nodes.amkwebsolutions.com/api';
  // static const String baseUrl = 'http://192.168.61.231:8000/api';
  static String productListUrl = 'https://dummyjson.com/products';

  ///==============================  common API ==================================

  // --------- Login and Sign up -----------------
  static String signUpApiUrl           = '$baseUrl/signup';
  static String loginApiUrl            = '$baseUrl/login';

  // ---- Fetch profile and Update Profile -------
  static String getProfileApiUrl       = '$baseUrl/get-profile/';
  static String updateProfileApiUrl    = '$baseUrl/update-profile';


  ///==============================  Admin API ==================================

  // -------------- products ------------------

  static String products = '$baseUrl/products';
  static String getAdminProductsApiUrl = '$products/admin';
  static String addProductApiUrl       = '$products/add-product';
  static String deleteProductApiUrl    = '$products/';
  static String updateProductApiUrl    = '$products/';

  // -------------- Orders ------------------
  static String orders    = '$baseUrl/order';
  static String getAdminOrdersApiUrl    = '$orders/admin';
  static String getOrderDetailsApiUrl    = '$orders/details';
  static String updateOrderStatusApiUrl = '$orders/update-status';

///==============================  Customer API ==================================
  // -------------- products ------------------
  static String getProductsApiUrl = '$products/';


  // -------------- orders ------------------
  static String getMyOrdersApiUrl = '$orders/';
  static String addOrderApiUrl = '$orders/place-order';


  // --------------- cart ------------------

  static String cart                            = '$baseUrl/cart';
  static String getCartApiUrl                   =  cart;
  static String addToCartApiUrl                 = '$cart/add-to-cart';
  static String deleteCartProductApiUrl         = '$cart/delete-cart-products';
  static String deleteCartApiUrl                = '$cart/delete-cart';
  static String updateCartProductQuantityApiUrl = '$cart/update-product-qty';

///==============================  Collections API ==================================
  static String collectionApiUrl = '$baseUrl/collections';
  /// {{base_url}}/api/collections/1/products
  static String deleteCollectionProductsApiUrl = '$baseUrl/collections/products';

}