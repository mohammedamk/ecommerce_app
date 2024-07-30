class OrdersModel {
  OrdersModel({
      String? status, 
      List<OrderData>? data,}){
    _status = status;
    _data = data;
}

  OrdersModel.fromJson(dynamic json) {
    _status = json['status'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(OrderData.fromJson(v));
      });
    }
  }
  String? _status;
  List<OrderData>? _data;

  String? get status => _status;
  List<OrderData>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class OrderData {
  OrderData({
      String? id, 
      num? orderId, 
      num? customerId, 
      String? customerName, 
      String? customerAddress, 
      String? city, 
      String? state, 
      String? country, 
      String? pincode, 
      String? mobileNo, 
      List<OrderedProducts>? orderedProducts, 
      String? orderStatus, 
      num? totalItems, 
      num? totalAmount, 
      String? deliveryDate, 
      String? deliveryStatus, 
      String? createdAt, 
      String? updatedAt, 
      num? v,}){
    _id = id;
    _orderId = orderId;
    _customerId = customerId;
    _customerName = customerName;
    _customerAddress = customerAddress;
    _city = city;
    _state = state;
    _country = country;
    _pincode = pincode;
    _mobileNo = mobileNo;
    _orderedProducts = orderedProducts;
    _orderStatus = orderStatus;
    _totalItems = totalItems;
    _totalAmount = totalAmount;
    _deliveryDate = deliveryDate;
    _deliveryStatus = deliveryStatus;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
}

  OrderData.fromJson(dynamic json) {
    _id = json['_id'];
    _orderId = json['orderId'];
    _customerId = json['customerId'];
    _customerName = json['customerName'];
    _customerAddress = json['customerAddress'];
    _city = json['city'];
    _state = json['state'];
    _country = json['country'];
    _pincode = json['pincode'];
    _mobileNo = json['mobileNo'];
    if (json['orderedProducts'] != null) {
      _orderedProducts = [];
      json['orderedProducts'].forEach((v) {
        _orderedProducts?.add(OrderedProducts.fromJson(v));
      });
    }
    _orderStatus = json['orderStatus'];
    _totalItems = json['totalItems'];
    _totalAmount = json['totalAmount'];
    _deliveryDate = json['deliveryDate'];
    _deliveryStatus = json['deliveryStatus'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }
  String? _id;
  num? _orderId;
  num? _customerId;
  String? _customerName;
  String? _customerAddress;
  String? _city;
  String? _state;
  String? _country;
  String? _pincode;
  String? _mobileNo;
  List<OrderedProducts>? _orderedProducts;
  String? _orderStatus;
  num? _totalItems;
  num? _totalAmount;
  String? _deliveryDate;
  String? _deliveryStatus;
  String? _createdAt;
  String? _updatedAt;
  num? _v;

  String? get id => _id;
  num? get orderId => _orderId;
  num? get customerId => _customerId;
  String? get customerName => _customerName;
  String? get customerAddress => _customerAddress;
  String? get city => _city;
  String? get state => _state;
  String? get country => _country;
  String? get pincode => _pincode;
  String? get mobileNo => _mobileNo;
  List<OrderedProducts>? get orderedProducts => _orderedProducts;
  String? get orderStatus => _orderStatus;

  set setOrderStatus(String? value) {
    _orderStatus = value;
  }

  num? get totalItems => _totalItems;
  num? get totalAmount => _totalAmount;
  String? get deliveryDate => _deliveryDate;
  String? get deliveryStatus => _deliveryStatus;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['orderId'] = _orderId;
    map['customerId'] = _customerId;
    map['customerName'] = _customerName;
    map['customerAddress'] = _customerAddress;
    map['city'] = _city;
    map['state'] = _state;
    map['country'] = _country;
    map['pincode'] = _pincode;
    map['mobileNo'] = _mobileNo;
    if (_orderedProducts != null) {
      map['orderedProducts'] = _orderedProducts?.map((v) => v.toJson()).toList();
    }
    map['orderStatus'] = _orderStatus;
    map['totalItems'] = _totalItems;
    map['totalAmount'] = _totalAmount;
    map['deliveryDate'] = _deliveryDate;
    map['deliveryStatus'] = _deliveryStatus;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }

}

class OrderedProducts {
  OrderedProducts({
      num? productId, 
      num? adminId, 
      num? quantity, 
      String? id, 
      ProductDetails? productDetails,}){
    _productId = productId;
    _adminId = adminId;
    _quantity = quantity;
    _id = id;
    _productDetails = productDetails;
}

  OrderedProducts.fromJson(dynamic json) {
    _productId = json['productId'];
    _adminId = json['adminId'];
    _quantity = json['quantity'];
    _id = json['_id'];
    _productDetails = json['productDetails'] != null ? ProductDetails.fromJson(json['productDetails']) : null;
  }
  num? _productId;
  num? _adminId;
  num? _quantity;
  String? _id;
  ProductDetails? _productDetails;

  num? get productId => _productId;
  num? get adminId => _adminId;
  num? get quantity => _quantity;
  String? get id => _id;
  ProductDetails? get productDetails => _productDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['productId'] = _productId;
    map['adminId'] = _adminId;
    map['quantity'] = _quantity;
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