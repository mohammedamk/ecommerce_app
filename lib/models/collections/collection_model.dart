class CollectionsModels {
  CollectionsModels({
      String? status, 
      List<CollectionsData>? data,}){
    _status = status;
    _data = data;
}

  CollectionsModels.fromJson(dynamic json) {
    _status = json['status'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(CollectionsData.fromJson(v));
      });
    }
  }
  String? _status;
  List<CollectionsData>? _data;

  String? get status => _status;
  List<CollectionsData>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class CollectionsData {
  CollectionsData({
      String? id, 
      String? collectionId, 
      String? adminId, 
      String? handle, 
      String? title, 
      String? description, 
      num? productsCount, 
      List<String>? products, 
      String? createdAt, 
      String? updatedAt, 
      num? v,}){
    _id = id;
    _collectionId = collectionId;
    _adminId = adminId;
    _handle = handle;
    _title = title;
    _description = description;
    _productsCount = productsCount;
    _products = products;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
}

  CollectionsData.fromJson(dynamic json) {
    _id = json['_id'];
    _collectionId = json['collectionId'];
    _adminId = json['adminId'];
    _handle = json['handle'];
    _title = json['title'];
    _description = json['description'];
    _productsCount = json['products_count'];
    _products = json['products'] != null ? json['products'].cast<String>() : [];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }
  String? _id;
  String? _collectionId;
  String? _adminId;
  String? _handle;
  String? _title;
  String? _description;
  num? _productsCount;
  List<String>? _products;
  String? _createdAt;
  String? _updatedAt;
  num? _v;

  String? get id => _id;
  String? get collectionId => _collectionId;
  String? get adminId => _adminId;
  String? get handle => _handle;
  String? get title => _title;
  String? get description => _description;
  num? get productsCount => _productsCount;
  List<String>? get products => _products;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['collectionId'] = _collectionId;
    map['adminId'] = _adminId;
    map['handle'] = _handle;
    map['title'] = _title;
    map['description'] = _description;
    map['products_count'] = _productsCount;
    map['products'] = _products;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }

}