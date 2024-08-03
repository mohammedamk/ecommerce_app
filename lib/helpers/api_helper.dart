import 'dart:convert';
import 'dart:developer';
import "package:http/http.dart" as http;
import '../constants/controller_const.dart';


String token = '';

class ApiHelper {

  Future<void> getToken() async {
    //TODO Here we take token from share pre
    token = await authPreference.getToken();
    log(token);
  }

  /// ==================================== Rest API Services =================================================

  /// ======================================= Post Service ========================================
  Future<http.Response?> post({
    required String api,
    required Map<String, dynamic> body,
    required Function({required http.Response response}) onSuccess,
    required Function({required String message}) onFailure,
  }) async {
    // bool isInternetAvalble = await internetController.checkInternetConnection();
    //
    // if (!isInternetAvalble) {
    //   onFailure(message: 'Please check your internet connection');
    //   return null;
    // }
    await getToken();

    var headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };
    final res = await http
        .post(
      Uri.parse(api),
      headers: headers,
      body: jsonEncode(body),
    )
        .catchError((e) => onFailure(message: e.message));
    log(res.body);

    String status = checkStatus(res: res);
    if (status == 'success') {
      onSuccess(response: res);
      return res;
    } else {
      onFailure(message: status);
      return null;
    }
  }

  /// ============================== Post Multipart Service ========================================

  Future<String> postMultipart({
    required String key,
    required String api,
    required String path,
    required Map<String, String> body,
    required Function({required String response}) onSuccess,
    required Function({required String message}) onFailure,
  }) async {
    await getToken();
    var headers = {
      'Authorization': 'Bearer $token',
      'Client-Service': 'frontend-client',
    };
    var request = http.MultipartRequest('POST', Uri.parse(api));
    request.fields.addAll(body);
    request.headers.addAll(headers);

    if (path.isNotEmpty) {
      var multipartFile = await http.MultipartFile.fromPath(key, path);
      request.files.add(multipartFile);
    }

    http.StreamedResponse response = await request.send();
    final respStr = await response.stream.bytesToString();

    String status = posImageErrorHandle(res: response, respStr: respStr);
    if (status == 'success') {
      onSuccess(response: respStr);
      return respStr;
    } else {
      onFailure(message: status);
      return '';
    }
  }


  Future<String> postMultiPartList({
    required String api,
    required List<http.MultipartFile> path,
    required Map<String, String> body,
    required Function({required String response}) onSuccess,
    required Function({required String message}) onFailure,
  }) async {
    var headers = {
      'Authorization': 'Bearer $token',
      'Client-Service': 'frontend-client',
    };
    var request = http.MultipartRequest('POST', Uri.parse(api));
    request.fields.addAll(body);
    request.headers.addAll(headers);
    if (path.isNotEmpty) {
      request.files.addAll(path);
    }
    http.StreamedResponse response = await request.send();

    var responseBytes = await response.stream.toBytes();
    var respStr = String.fromCharCodes(responseBytes);
    log('Response: $respStr');

    String status = posImageErrorHandle(res: response, respStr: respStr);
    if (status == 'success') {
      onSuccess(response: respStr);
      return respStr;
    } else {
      onFailure(message: status);
      return '';
    }
  }
  /// ======================================= Get Service ========================================

  Future<http.Response?> get({
    required String api,
    required Map<String, dynamic> body,
    required Function({required http.Response response}) onSuccess,
    required Function({required String message}) onFailure,
  }) async {
    await getToken();
    var headers = {
      'Authorization': 'Bearer $token',
      'Client-Service': 'frontend-client'
    };
    final res = await http
        .get(
      Uri.parse(api),
      headers: headers,
    )
        .catchError((e) {
      log(e.toString());
      return e;
    });
    String status = checkStatus(res: res);
    if (status == 'success') {
      onSuccess(response: res);
      return res;
    } else {
      onFailure(message: status);
      return null;
    }
  }

  /// ======================================= Put Service ========================================

  Future<http.Response?> put({
    required String api,
    required Map<String, dynamic> body,
    required Function({required http.Response response}) onSuccess,
    required Function({required String message}) onFailure,
  }) async {
    await getToken();
    var headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    final res = await http
        .put(
      Uri.parse(api),
      body: jsonEncode(body),
      headers: headers,
    )
        .catchError((e) {
      log(e.toString());
      return e;
    });
    String status = checkStatus(res: res);
    if (status == 'success') {
      onSuccess(response: res);
      return res;
    } else {
      onFailure(message: status);
      return null;
    }
  }

  /// ======================================= Patch Service ========================================

  Future<http.Response?> patch({
    required String api,
    required Map<String, dynamic> body,
    required Function({required http.Response response}) onSuccess,
    required Function({required String message}) onFailure,
  }) async {
    await getToken();
    var headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    final res = await http
        .patch(
      Uri.parse(api),
      body: jsonEncode(body),
      headers: headers,
    )
        .catchError((e) {
      log(e.toString());
      return e;

    });
    String status = checkStatus(res: res);
    if (status == 'success') {
      onSuccess(response: res);
      return res;
    } else {
      onFailure(message: status);
      return null;
    }
  }

  /// ======================================= Delete Service ========================================
  Future<http.Response?> delete({
    required String api,
    required Map<String, dynamic> body,
    required Function({required http.Response response}) onSuccess,
    required Function({required String message}) onFailure,
  }) async {
    await getToken();
    var headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    final res = await http
        .delete(
      Uri.parse(api),
      body: jsonEncode(body),
      headers: headers,
    )
        .catchError((e) {
      log(e.toString());
      return e;

    });
    String status = checkStatus(res: res);
    if (status == 'success') {
      onSuccess(response: res);
      return res;
    } else {
      onFailure(message: status);
      return null;
    }
  }

  /// ======================================= Error handler =========================================
  static String checkStatus({required http.Response res}) {
    String status = '';

    switch (res.statusCode) {
      case 200:
        status = 'success';

        break;
      case 201:
        status = 'success';

        break;
      case 401:

      /// here we logout user
        break;
      case 409:
        status = jsonDecode(res.body)['message'];
        break;

      case 422:
        status = jsonDecode(res.body)['message'];

        break;
      case 500:
        status = 'Internal server error';

        break;

      default:
        status = 'other error ${jsonDecode(res.body)['message']}';
    }
    return status;
  }

  ///====================================== Error image handle ======================================
  static String posImageErrorHandle(
      {required http.StreamedResponse res, required String respStr}) {
    String status = '';
    Map<String, dynamic> obj = jsonDecode(respStr);

    switch (res.statusCode) {
      case 200:
        status = 'success';

        break;
      case 201:
        status = 'success';

        break;
      case 401:

      /// here we logout user
        break;
      case 400:
        status = obj['message'];
        break;
      case 409:
        status = obj['message'];
        break;

      case 422:
        status = obj['message'];

        break;
      case 500:
        status = 'Internal server error';

        break;

      default:
        status = 'other error ${res.statusCode}';
    }
    return status;
  }
}
