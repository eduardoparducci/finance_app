import 'dart:convert' as convert;

import 'package:dio/dio.dart';

/// FormController is a class which does work of saving FeedbackForm in Google Sheets using
/// HTTP GET request on Google App Script Web URL and parses response and sends result callback.
class HttpController {

  final Dio dio;

  HttpController(this.dio);

  /// Async function which creates a new source
  Future<dynamic> doPost<R>(String url, R Function(dynamic data) parseData, {Map<String, dynamic>? body, Map<String, dynamic>? query,}) async {
    try {
      final res = await dio.post(
          url,
          data: body,
          queryParameters: query
      );

      if (res.data['success']) {
        return parseData(res.data);
      } else {
        return res.data['message'];
      }
    } on DioError catch (e) {
      return "Error getting data from API";
    }
  }

}