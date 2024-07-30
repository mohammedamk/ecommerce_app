

import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/admin/auth/admin_user_model.dart';
import '../../../models/customers/auth/customer_user_model.dart';


class AuthPreference extends GetxController{
  static AuthPreference instance = Get.find();
  SharedPreferences? authPrf;
  String keyToken = 'token';
  String currency = 'currency';
  String currentCenterID = 'center_id';
  String keyCenterModel = 'center';
  String keyAdminUser = 'admin_user';
  String keyCustomerUser = 'customer_user';
  String keyUserType = 'type';

  Future<void> saveUserToken({required String token})async{
    authPrf = await SharedPreferences.getInstance();
    try{
      await authPrf!.setString(keyToken, token);
    }catch(e){
      rethrow;
    }
  }

  Future<String> getToken()async{
    authPrf = await SharedPreferences.getInstance();
    String token = authPrf!.getString(keyToken)??'';
    return token;
  }

  Future<void> saveUserType({required String userType})async{
    authPrf = await SharedPreferences.getInstance();
    try{
      await authPrf!.setString(keyUserType, userType);
    }catch(e){
      rethrow;
    }
  }

  Future<String> getType()async{
    authPrf = await SharedPreferences.getInstance();
    String userType = authPrf!.getString(keyUserType)??'';
    return userType;
  }

  Future<void> saveAdminUserModel({required AdminData model})async{
    authPrf = await SharedPreferences.getInstance();
    try{
      String userString  = jsonEncode(model.toJson());
      log(userString);
      await authPrf!.setString(keyAdminUser, userString);
    }catch(e){
      rethrow;
    }
  }

  Future<AdminData> getAdminUserModel()async{
    authPrf = await SharedPreferences.getInstance();
    String userString = authPrf!.getString(keyAdminUser)??'';
    var obj= jsonDecode(userString);
    AdminData userModel = AdminData.fromJson(obj);
    return userModel;
  }

  Future<void> saveCustomerUserModel({required CustomerData model})async{
    authPrf = await SharedPreferences.getInstance();
    try{
      String userString  = jsonEncode(model.toJson());
      await authPrf!.setString(keyCustomerUser, userString);
    }catch(e){
      rethrow;
    }
  }

  Future<CustomerData> getCustomerUserModel()async{
    authPrf = await SharedPreferences.getInstance();
    String userString = authPrf!.getString(keyCustomerUser)??'';
    Map<String, dynamic> obj= jsonDecode(userString);
    CustomerData userModel = CustomerData.fromJson(obj);
    return userModel;
  }


  Future<void> clearSharedData() async {
    authPrf = await SharedPreferences.getInstance();
    await authPrf!.remove(keyToken);
    await authPrf!.remove(keyAdminUser);
    await authPrf!.remove(keyCustomerUser);
    await authPrf!.remove(keyUserType);
    await authPrf!.remove(currentCenterID);
    await authPrf!.remove(keyCenterModel);
  }

}