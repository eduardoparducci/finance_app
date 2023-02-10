import 'package:dio/dio.dart';
import '../config/constants.dart' as constants;

class CategoryModel {
  num id;
  String icon;
  String name;
  double limit;

  CategoryModel({
    required this.id,
    required this.icon,
    required this.name,
    required this.limit
  });

  factory CategoryModel.fromMap(Map<String, dynamic> json) {
    return CategoryModel(
        id: json['id'],
        name: json['name'],
        icon: json['icon'],
        limit: json['limit']
    );
  }

  List<CategoryModel> decodeCategories(List<dynamic> responseBody) {
    return responseBody
        .map<CategoryModel>((json) => CategoryModel.fromMap(json))
        .toList();
  }

  Future<List<CategoryModel>> getCategories() async {
    try {
      var params = {
        'entity': 'category',
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