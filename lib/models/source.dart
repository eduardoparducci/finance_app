import 'dart:io';

import 'package:dio/dio.dart';
import '../config/constants.dart' as constants;

class SourceModel {
  num id;
  String icon;
  String name;
  double limit;
  DateTime dueDate;

  SourceModel({
    required this.id,
    required this.icon,
    required this.name,
    required this.limit,
    required this.dueDate
  });

  factory SourceModel.fromMap(Map<String, dynamic> json) {
    return SourceModel(
        id: json['id'],
        name: json['name'],
        icon: json['icon'],
        limit: json['limit'],
        dueDate: json['due_date']
    );
  }

  List<SourceModel> decodeCategories(List<dynamic> responseBody) {
    return responseBody
        .map<SourceModel>((json) => SourceModel.fromMap(json))
        .toList();
  }

  Future<List<SourceModel>> getCategories() async {
    try {
      var params = {
        'entity': 'source',
        'action': 'list'
      };
      var response = await Dio().post(constants.API_URL, data: {}, queryParameters: params);

      if (response.statusCode == 200) {
        return decodeCategories(response.data);
      } else {
        throw Exception('Unable to fetch data from the REST API');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}