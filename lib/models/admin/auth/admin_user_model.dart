class AdminUserModel {
  AdminUserModel({
      String? status, 
      String? message, 
      String? token, 
      AdminData? data,}){
    _status = status;
    _message = message;
    _token = token;
    _data = data;
}

  AdminUserModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _token = json['token'];
    _data = json['data'] != null ? AdminData.fromJson(json['data']) : null;
  }
  String? _status;
  String? _message;
  String? _token;
  AdminData? _data;

  String? get status => _status;
  String? get message => _message;
  String? get token => _token;
  AdminData? get data => _data;

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

class AdminData {
  AdminData({
      num? adminId, 
      String? profilePic, 
      String? fullName, 
      String? email, 
      String? companyName, 
      String? password, 
      String? userType, 
      String? id, 
      String? createdAt, 
      String? updatedAt, 
      num? v,}){
    _adminId = adminId;
    _profilePic = profilePic;
    _fullName = fullName;
    _email = email;
    _companyName = companyName;
    _password = password;
    _userType = userType;
    _id = id;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
}

  AdminData.fromJson(dynamic json) {
    _adminId = json['adminId'];
    _profilePic = json['profilePic'];
    _fullName = json['fullName'];
    _email = json['email'];
    _companyName = json['companyName'];
    _password = json['password'];
    _userType = json['userType'];
    _id = json['_id'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }
  num? _adminId;
  String? _profilePic;
  String? _fullName;
  String? _email;
  String? _companyName;
  String? _password;
  String? _userType;
  String? _id;
  String? _createdAt;
  String? _updatedAt;
  num? _v;

  num? get adminId => _adminId;
  String? get profilePic => _profilePic;
  String? get fullName => _fullName;
  String? get email => _email;
  String? get companyName => _companyName;
  String? get password => _password;
  String? get userType => _userType;
  String? get id => _id;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adminId'] = _adminId;
    map['profilePic'] = _profilePic;
    map['fullName'] = _fullName;
    map['email'] = _email;
    map['companyName'] = _companyName;
    map['password'] = _password;
    map['userType'] = _userType;
    map['_id'] = _id;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }

}