import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:getxdemo/MVMM_Practice/Data/Networks/base_api_services.dart';
import 'package:http/http.dart' as http;
import '../app_exceptions.dart';

class NetworkApiServices extends BaseApiServices {
  // this is the get API function to get the API from the server
  @override
  Future<dynamic> getAPI(String url) async {
    if (kDebugMode) {
      print(url);
    }

    dynamic jsonResponse;

    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));

      jsonResponse = returnResponse(response);
    } on SocketException {
      throw InternetExceptions();
    } on TimeOutExceptions {
      throw TimeOutExceptions();
    }
    return jsonResponse;
  }

// this is the post API to check the server response while logging in

  @override
  Future<dynamic> postAPI(var data, String url) async {
    if (kDebugMode) {
      print(url);
      print(data);
    }
    dynamic jsonResponse;

    try {
      final response = await http
          .post(
            Uri.parse(url),
            body: jsonEncode(data),
          )
          .timeout(const Duration(seconds: 10));

      jsonResponse = returnResponse(response);
    } on SocketException {
      throw InternetExceptions("");
    } on TimeOutExceptions {
      throw TimeOutExceptions("");
    }
    return jsonResponse;
  }
// This is the dynamic function of getting response according to the status code

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      case 400:
        throw InvalidURLException();
      default:
        throw FetchingDataExceptions(
            "Error While Fetching Data!${response.statusCode}");
    }
  }
}
