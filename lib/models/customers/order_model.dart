class OrderModel {
  OrderModel({
      List<Orders>? orders,}){
    _orders = orders;
}

  OrderModel.fromJson(dynamic json) {
    if (json['orders'] != null) {
      _orders = [];
      json['orders'].forEach((v) {
        _orders?.add(Orders.fromJson(v));
      });
    }
  }
  List<Orders>? _orders;

  List<Orders>? get orders => _orders;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_orders != null) {
      map['orders'] = _orders?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Orders {
  Orders({
      String? id,
      String? fullName,
      String? mobileNo,
      String? address, 
      String? city, 
      String? state, 
      String? country, 
      String? pincode, 
      num? totalItems, 
      num? totalPrice, 
      String? orderDate, 
      String? deliveryDate, 
      String? createdAt, 
      List<ProductsList>? products,

  }){
    _id = id;
    _fullName = fullName;
    _mobileNo = mobileNo;
    _address = address;
    _city = city;
    _state = state;
    _country = country;
    _pincode = pincode;
    _totalItems = totalItems;
    _totalPrice = totalPrice;
    _orderDate = orderDate;
    _deliveryDate = deliveryDate;
    _createdAt = createdAt;
    _products = products;
}

  Orders.fromJson(dynamic json) {
    _id = json['id'];
    _fullName = json['fullName'];
    _mobileNo = json['mobileNo'];
    _address = json['address'];
    _city = json['city'];
    _state = json['state'];
    _country = json['country'];
    _pincode = json['pincode'];
    _totalItems = json['totalItems'];
    _totalPrice = json['totalPrice'];
    _orderDate = json['orderDate'];
    _deliveryDate = json['deliveryDate'];
    _createdAt = json['createdAt'];
    if (json['products'] != null) {
      _products = [];
      json['products'].forEach((v) {
        _products?.add(ProductsList.fromJson(v));
      });
    }
  }
  String? _id;
  String? _fullName;
  String? _mobileNo;
  String? _address;
  String? _city;
  String? _state;
  String? _country;
  String? _pincode;
  num? _totalItems;
  num? _totalPrice;
  String? _orderDate;
  String? _deliveryDate;
  String? _createdAt;
  List<ProductsList>? _products;

  String? get id => _id;
  String? get fullName => _fullName;
  String? get mobileNo => _mobileNo;
  String? get address => _address;
  String? get city => _city;
  String? get state => _state;
  String? get country => _country;
  String? get pincode => _pincode;
  num? get totalItems => _totalItems;
  num? get totalPrice => _totalPrice;
  String? get orderDate => _orderDate;
  String? get deliveryDate => _deliveryDate;
  String? get createdAt => _createdAt;
  List<ProductsList>? get products => _products;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['fullName'] = _fullName;
    map['mobileNo'] = _mobileNo;
    map['address'] = _address;
    map['city'] = _city;
    map['state'] = _state;
    map['country'] = _country;
    map['pincode'] = _pincode;
    map['totalItems'] = _totalItems;
    map['totalPrice'] = _totalPrice;
    map['orderDate'] = _orderDate;
    map['deliveryDate'] = _deliveryDate;
    map['createdAt'] = _createdAt;
    if (_products != null) {
      map['products'] = _products?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class ProductsList {
  ProductsList({
      num? id, 
      String? title, 
      String? description, 
      String? category, 
      num? price, 
      num? discountPercentage, 
      num? rating, 
      num? stock, 
      List<String>? tags, 
      String? brand, 
      String? sku, 
      num? weight, 
      Dimensions? dimensions, 
      String? warrantyInformation, 
      String? shippingInformation, 
      String? availabilityStatus, 
      List<Reviews>? reviews, 
      String? returnPolicy, 
      num? minimumOrderQuantity, 
      Meta? meta, 
      List<String>? images, 
      String? thumbnail,}){
    _id = id;
    _title = title;
    _description = description;
    _category = category;
    _price = price;
    _discountPercentage = discountPercentage;
    _rating = rating;
    _stock = stock;
    _tags = tags;
    _brand = brand;
    _sku = sku;
    _weight = weight;
    _dimensions = dimensions;
    _warrantyInformation = warrantyInformation;
    _shippingInformation = shippingInformation;
    _availabilityStatus = availabilityStatus;
    _reviews = reviews;
    _returnPolicy = returnPolicy;
    _minimumOrderQuantity = minimumOrderQuantity;
    _meta = meta;
    _images = images;
    _thumbnail = thumbnail;
}

  ProductsList.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _description = json['description'];
    _category = json['category'];
    _price = json['price'];
    _discountPercentage = json['discountPercentage'];
    _rating = json['rating'];
    _stock = json['stock'];
    _tags = json['tags'] != null ? json['tags'].cast<String>() : [];
    _brand = json['brand'];
    _sku = json['sku'];
    _weight = json['weight'];
    _dimensions = json['dimensions'] != null ? Dimensions.fromJson(json['dimensions']) : null;
    _warrantyInformation = json['warrantyInformation'];
    _shippingInformation = json['shippingInformation'];
    _availabilityStatus = json['availabilityStatus'];
    if (json['reviews'] != null) {
      _reviews = [];
      json['reviews'].forEach((v) {
        _reviews?.add(Reviews.fromJson(v));
      });
    }
    _returnPolicy = json['returnPolicy'];
    _minimumOrderQuantity = json['minimumOrderQuantity'];
    _meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    _images = json['images'] != null ? json['images'].cast<String>() : [];
    _thumbnail = json['thumbnail'];
  }
  num? _id;
  String? _title;
  String? _description;
  String? _category;
  num? _price;
  num? _discountPercentage;
  num? _rating;
  num? _stock;
  List<String>? _tags;
  String? _brand;
  String? _sku;
  num? _weight;
  Dimensions? _dimensions;
  String? _warrantyInformation;
  String? _shippingInformation;
  String? _availabilityStatus;
  List<Reviews>? _reviews;
  String? _returnPolicy;
  num? _minimumOrderQuantity;
  Meta? _meta;
  List<String>? _images;
  String? _thumbnail;

  num? get id => _id;
  String? get title => _title;
  String? get description => _description;
  String? get category => _category;
  num? get price => _price;
  num? get discountPercentage => _discountPercentage;
  num? get rating => _rating;
  num? get stock => _stock;
  List<String>? get tags => _tags;
  String? get brand => _brand;
  String? get sku => _sku;
  num? get weight => _weight;
  Dimensions? get dimensions => _dimensions;
  String? get warrantyInformation => _warrantyInformation;
  String? get shippingInformation => _shippingInformation;
  String? get availabilityStatus => _availabilityStatus;
  List<Reviews>? get reviews => _reviews;
  String? get returnPolicy => _returnPolicy;
  num? get minimumOrderQuantity => _minimumOrderQuantity;
  Meta? get meta => _meta;
  List<String>? get images => _images;
  String? get thumbnail => _thumbnail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['description'] = _description;
    map['category'] = _category;
    map['price'] = _price;
    map['discountPercentage'] = _discountPercentage;
    map['rating'] = _rating;
    map['stock'] = _stock;
    map['tags'] = _tags;
    map['brand'] = _brand;
    map['sku'] = _sku;
    map['weight'] = _weight;
    if (_dimensions != null) {
      map['dimensions'] = _dimensions?.toJson();
    }
    map['warrantyInformation'] = _warrantyInformation;
    map['shippingInformation'] = _shippingInformation;
    map['availabilityStatus'] = _availabilityStatus;
    if (_reviews != null) {
      map['reviews'] = _reviews?.map((v) => v.toJson()).toList();
    }
    map['returnPolicy'] = _returnPolicy;
    map['minimumOrderQuantity'] = _minimumOrderQuantity;
    if (_meta != null) {
      map['meta'] = _meta?.toJson();
    }
    map['images'] = _images;
    map['thumbnail'] = _thumbnail;
    return map;
  }

}

class Meta {
  Meta({
      String? createdAt, 
      String? updatedAt, 
      String? barcode, 
      String? qrCode,}){
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _barcode = barcode;
    _qrCode = qrCode;
}

  Meta.fromJson(dynamic json) {
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _barcode = json['barcode'];
    _qrCode = json['qrCode'];
  }
  String? _createdAt;
  String? _updatedAt;
  String? _barcode;
  String? _qrCode;

  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get barcode => _barcode;
  String? get qrCode => _qrCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['barcode'] = _barcode;
    map['qrCode'] = _qrCode;
    return map;
  }

}

class Reviews {
  Reviews({
      num? rating, 
      String? comment, 
      String? date, 
      String? reviewerName, 
      String? reviewerEmail,}){
    _rating = rating;
    _comment = comment;
    _date = date;
    _reviewerName = reviewerName;
    _reviewerEmail = reviewerEmail;
}

  Reviews.fromJson(dynamic json) {
    _rating = json['rating'];
    _comment = json['comment'];
    _date = json['date'];
    _reviewerName = json['reviewerName'];
    _reviewerEmail = json['reviewerEmail'];
  }
  num? _rating;
  String? _comment;
  String? _date;
  String? _reviewerName;
  String? _reviewerEmail;

  num? get rating => _rating;
  String? get comment => _comment;
  String? get date => _date;
  String? get reviewerName => _reviewerName;
  String? get reviewerEmail => _reviewerEmail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['rating'] = _rating;
    map['comment'] = _comment;
    map['date'] = _date;
    map['reviewerName'] = _reviewerName;
    map['reviewerEmail'] = _reviewerEmail;
    return map;
  }

}

class Dimensions {
  Dimensions({
      num? width, 
      num? height, 
      num? depth,}){
    _width = width;
    _height = height;
    _depth = depth;
}

  Dimensions.fromJson(dynamic json) {
    _width = json['width'];
    _height = json['height'];
    _depth = json['depth'];
  }
  num? _width;
  num? _height;
  num? _depth;

  num? get width => _width;
  num? get height => _height;
  num? get depth => _depth;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['width'] = _width;
    map['height'] = _height;
    map['depth'] = _depth;
    return map;
  }

}