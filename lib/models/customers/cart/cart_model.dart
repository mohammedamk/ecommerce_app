import 'package:get/get.dart';

class CartModel {
  CartModel({
      String? status, 
      CartData? data,}){
    _status = status;
    _data = data;
}

  CartModel.fromJson(dynamic json) {
    _status = json['status'];
    _data = json['data'] != null ? CartData.fromJson(json['data']) : null;
  }
  String? _status;
  CartData? _data;

  String? get status => _status;
  CartData? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

class CartData {
  CartData({
      String? id, 
      num? cartId, 
      num? customerId, 
      List<AddedProducts>? addedProducts, 
      String? createdAt, 
      String? updatedAt, 
      num? v,}){
    _id = id;
    _cartId = cartId;
    _customerId = customerId;
    _addedProducts = addedProducts;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
}

  CartData.fromJson(dynamic json) {
    _id = json['_id'];
    _cartId = json['cartId'];
    _customerId = json['customerId'];
    if (json['addedProducts'] != null) {
      _addedProducts = [];
      json['addedProducts'].forEach((v) {
        _addedProducts?.add(AddedProducts.fromJson(v));
      });
    }
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }
  String? _id;
  num? _cartId;
  num? _customerId;
  List<AddedProducts>? _addedProducts;
  String? _createdAt;
  String? _updatedAt;
  num? _v;

  String? get id => _id;
  num? get cartId => _cartId;
  num? get customerId => _customerId;
  List<AddedProducts>? get addedProducts => _addedProducts;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['cartId'] = _cartId;
    map['customerId'] = _customerId;
    if (_addedProducts != null) {
      map['addedProducts'] = _addedProducts?.map((v) => v.toJson()).toList();
    }
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }

}

class AddedProducts {
  AddedProducts({
      num? productId, 
      num? adminId, 
      Rx<num>? quantity,
      String? id, 
      ProductDetails? productDetails,}){
    _productId = productId;
    _adminId = adminId;
    _quantity = quantity;
    _id = id;
    _productDetails = productDetails;
}

  AddedProducts.fromJson(dynamic json) {
    _productId = json['productId'];
    _adminId = json['adminId'];
    _quantity = (json['quantity'] as num).obs;
    _id = json['_id'];
    _productDetails = json['productDetails'] != null ? ProductDetails.fromJson(json['productDetails']) : null;
  }
  num? _productId;
  num? _adminId;
  Rx<num>? _quantity;
  String? _id;
  ProductDetails? _productDetails;

  num? get productId => _productId;
  num? get adminId => _adminId;
  Rx<num>? get quantity => _quantity;
  String? get id => _id;
  ProductDetails? get productDetails => _productDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['productId'] = _productId;
    map['adminId'] = _adminId;
    map['quantity'] = _quantity!.value;
    map['_id'] = _id;
    if (_productDetails != null) {
      map['productDetails'] = _productDetails?.toJson();
    }
    return map;
  }

}

class ProductDetails {
  ProductDetails({
      String? id, 
      num? productId, 
      String? adminId, 
      String? title, 
      String? description, 
      String? category, 
      String? brand, 
      String? sku, 
      num? stocks, 
      String? availabilityStatus, 
      num? price, 
      num? discountPercentage, 
      String? weight, 
      num? length, 
      num? width, 
      num? height, 
      String? warranty, 
      String? shippingInformation, 
      String? returnPolicy, 
      List<String>? imageUrls, 
      String? thumbnail, 
      List<dynamic>? reviews, 
      String? createdAt, 
      String? updatedAt, 
      num? v,}){
    _id = id;
    _productId = productId;
    _adminId = adminId;
    _title = title;
    _description = description;
    _category = category;
    _brand = brand;
    _sku = sku;
    _stocks = stocks;
    _availabilityStatus = availabilityStatus;
    _price = price;
    _discountPercentage = discountPercentage;
    _weight = weight;
    _length = length;
    _width = width;
    _height = height;
    _warranty = warranty;
    _shippingInformation = shippingInformation;
    _returnPolicy = returnPolicy;
    _imageUrls = imageUrls;
    _thumbnail = thumbnail;
    _reviews = reviews;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
}

  ProductDetails.fromJson(dynamic json) {
    _id = json['_id'];
    _productId = json['productId'];
    _adminId = json['adminId'];
    _title = json['title'];
    _description = json['description'];
    _category = json['category'];
    _brand = json['brand'];
    _sku = json['sku'];
    _stocks = json['stocks'];
    _availabilityStatus = json['availabilityStatus'];
    _price = json['price'];
    _discountPercentage = json['discountPercentage'];
    _weight = json['weight'];
    _length = json['length'];
    _width = json['width'];
    _height = json['height'];
    _warranty = json['warranty'];
    _shippingInformation = json['shippingInformation'];
    _returnPolicy = json['returnPolicy'];
    _imageUrls = json['imageUrls'] != null ? json['imageUrls'].cast<String>() : [];
    _thumbnail = json['thumbnail'];
    if (json['reviews'] != null) {
      _reviews = [];
      // json['reviews'].forEach((v) {
      //   _reviews?.add(Dynamic.fromJson(v));
      // });
    }
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }
  String? _id;
  num? _productId;
  String? _adminId;
  String? _title;
  String? _description;
  String? _category;
  String? _brand;
  String? _sku;
  num? _stocks;
  String? _availabilityStatus;
  num? _price;
  num? _discountPercentage;
  String? _weight;
  num? _length;
  num? _width;
  num? _height;
  String? _warranty;
  String? _shippingInformation;
  String? _returnPolicy;
  List<String>? _imageUrls;
  String? _thumbnail;
  List<dynamic>? _reviews;
  String? _createdAt;
  String? _updatedAt;
  num? _v;

  String? get id => _id;
  num? get productId => _productId;
  String? get adminId => _adminId;
  String? get title => _title;
  String? get description => _description;
  String? get category => _category;
  String? get brand => _brand;
  String? get sku => _sku;
  num? get stocks => _stocks;
  String? get availabilityStatus => _availabilityStatus;
  num? get price => _price;
  num? get discountPercentage => _discountPercentage;
  String? get weight => _weight;
  num? get length => _length;
  num? get width => _width;
  num? get height => _height;
  String? get warranty => _warranty;
  String? get shippingInformation => _shippingInformation;
  String? get returnPolicy => _returnPolicy;
  List<String>? get imageUrls => _imageUrls;
  String? get thumbnail => _thumbnail;
  List<dynamic>? get reviews => _reviews;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['productId'] = _productId;
    map['adminId'] = _adminId;
    map['title'] = _title;
    map['description'] = _description;
    map['category'] = _category;
    map['brand'] = _brand;
    map['sku'] = _sku;
    map['stocks'] = _stocks;
    map['availabilityStatus'] = _availabilityStatus;
    map['price'] = _price;
    map['discountPercentage'] = _discountPercentage;
    map['weight'] = _weight;
    map['length'] = _length;
    map['width'] = _width;
    map['height'] = _height;
    map['warranty'] = _warranty;
    map['shippingInformation'] = _shippingInformation;
    map['returnPolicy'] = _returnPolicy;
    map['imageUrls'] = _imageUrls;
    map['thumbnail'] = _thumbnail;
    if (_reviews != null) {
      map['reviews'] = _reviews?.map((v) => v.toJson()).toList();
    }
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }

}