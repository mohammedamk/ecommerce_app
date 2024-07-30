class AddressModel {
  AddressModel({
    List<AllAddress>? allAddress,
  }) {
    _allAddress = allAddress;
  }

  AddressModel.fromJson(dynamic json) {
    if (json['allAddress'] != null) {
      _allAddress = [];
      json['allAddress'].forEach((v) {
        _allAddress?.add(AllAddress.fromJson(v));
      });
    }
  }

  List<AllAddress>? _allAddress;

  List<AllAddress>? get allAddress => _allAddress;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_allAddress != null) {
      map['allAddress'] = _allAddress?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class AllAddress {
  AllAddress({
    num? id,
    String? fullName,
    String? mobileNo,
    String? address,
    String? city,
    String? state,
    String? country,
    String? pincode,

  }) {
    _id = id;
    _fullName = fullName;
    _mobileNo = mobileNo;
    _address = address;
    _city = city;
    _state = state;
    _country = country;
    _pincode = pincode;
  }
  AllAddress.fromJson(dynamic json) {
    _id = 1;
    _fullName = json['fullName'];
    _mobileNo = json['mobileNo'];
    _address = json['address'];
    _city = json['city'];
    _state = json['state'];
    _country = json['country'];
    _pincode = json['pincode'];
  }

  num? _id;
  String? _fullName;
  String? _mobileNo;
  String? _address;
  String? _city;
  String? _state;
  String? _country;
  String? _pincode;

  num? get id => _id;

  String? get fullName => _fullName;

  String? get mobileNo => _mobileNo;

  String? get address => _address;

  String? get city => _city;

  String? get state => _state;

  String? get country => _country;

  String? get pincode => _pincode;

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
    return map;
  }

  set setId(num? value) {
    _id = value;
  }

  set setFullName(String? value) {
    _fullName = value;
  }

  set setMobileNo(String? value) {
    _mobileNo = value;
  }

  set setAddress(String? value) {
    _address = value;
  }

  set setCity(String value) {
    _city = value;
  }

  set setState(String value) {
    _state = value;
  }

  set setCountry(String value) {
    _country = value;
  }

  set setPincode(String value) {
    _pincode = value;
  }
}
