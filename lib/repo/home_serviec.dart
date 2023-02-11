import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:task_app/model/model_video.dart';
import 'package:task_app/repo/api_status.dart';

import '../utils/constants.dart';

class HomeServices {
  static Future<Object> getVideoList() async {
    try {
      final response = await http.get(Uri.parse(GET_PRODUCTS));
      var body = json.decode(response.body);
      if (response.statusCode == 200 && body['success'] == true) {
        List<VideosModel> productList = (body["data"] as List)
            .map((data) => VideosModel.fromJson(data))
            .toList();
        return Success(responce: productList);
      } else {
        return Failure(
            code: INVALID_RESPONSE, errorResponce: INVALID_RESPONSE_MSG);
      }
    } on HttpException {
      return Failure(code: HTTP_ERROR, errorResponce: HTTP_ERROR_MSG);
    } on FormatException {
      return Failure(code: INVALID_FORMAT, errorResponce: INVALID_FORMAT_MSG);
    } on SocketException {
      return Failure(code: NO_INTERNATE, errorResponce: NO_INTERNATE_MSG);
    } on TimeoutException {
      return Failure(code: TIME_OUT_ERROR, errorResponce: TIME_OUT_ERROR_MSG);
    } catch (e) {
      return Failure(code: UNKNOWN_ERROR, errorResponce: UNKNOWN_ERROR_MSG);
    }
  }
}
