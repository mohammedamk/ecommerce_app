class CustomerUserModel {
  CustomerUserModel({
      String? status, 
      String? message, 
      String? token, 
      CustomerData? data,}){
    _status = status;
    _message = message;
    _token = token;
    _data = data;
}

  CustomerUserModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _token = json['token'];
    _data = json['data'] != null ? CustomerData.fromJson(json['data']) : null;
  }
  String? _status;
  String? _message;
  String? _token;
  CustomerData? _data;

  String? get status => _status;
  String? get message => _message;
  String? get token => _token;
  CustomerData? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    map['token'] = _token;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

class CustomerData {
  CustomerData({
      num? customerId, 
      String? fullName, 
      String? email, 
      String? userType, 
      String? password, 
      String? id, 
      String? createdAt, 
      String? updatedAt, 
      num? v,}){
    _customerId = customerId;
    _fullName = fullName;
    _email = email;
    _userType = userType;
    _password = password;
    _id = id;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
}

  CustomerData.fromJson(dynamic json) {
    _customerId = json['customerId'];
    _fullName = json['fullName'];
    _email = json['email'];
    _userType = json['userType'];
    _password = json['password'];
    _id = json['_id'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }
  num? _customerId;
  String? _fullName;
  String? _email;
  String? _userType;
  String? _password;
  String? _id;
  String? _createdAt;
  String? _updatedAt;
  num? _v;

  num? get customerId => _customerId;
  String? get fullName => _fullName;
  String? get email => _email;
  String? get userType => _userType;
  String? get password => _password;
  String? get id => _id;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['customerId'] = _customerId;
    map['fullName'] = _fullName;
    map['email'] = _email;
    map['userType'] = _userType;
    map['password'] = _password;
    map['_id'] = _id;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }

}