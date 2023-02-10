import 'package:dio/dio.dart';
import '../config/constants.dart' as constants;

class ExpenseModel {
  int id;
  int categoryId;
  int sourceId;
  int instalments;
  int currentInstalment;
  double price;
  String dueTo;
  bool isRecurrent;
  String description;

  ExpenseModel({
    required this.id,
    required this.price,
    required this.description,
    this.categoryId=0,
    this.dueTo='',
    this.isRecurrent=false,
    this.instalments=0,
    this.currentInstalment=0,
    this.sourceId=0,
  });

  factory ExpenseModel.fromMap(Map<String, dynamic> json) {
    return ExpenseModel(
        id: json['id'],
        sourceId: json['source_id'],
        categoryId: json['category_id'],
        price: json['price'],
        dueTo: json['due_to'],
        isRecurrent: json['isRecurrent'],
        description: json['description'],
        instalments: json['instalments'],
        currentInstalment: json['current_instalment']
    );
  }

  List<ExpenseModel> decodeCategories(List<dynamic> responseBody) {
    return responseBody
        .map<ExpenseModel>((json) => ExpenseModel.fromMap(json))
        .toList();
  }

  Future<List<ExpenseModel>> getCategories() async {
    try {
      var params = {
        'entity': 'expense',
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