import 'dart:convert';
import 'package:dio/dio.dart';

class LakeModel {
  String imageUrl;
  String name;
  String about;

  LakeModel({required this.about, required this.name, required this.imageUrl});

  factory LakeModel.fromMap(Map<String, dynamic> json) {
    return LakeModel(
        about: json['about'],
        name: json['name'],
        imageUrl: json['url']
    );
  }

  List<LakeModel> decodeLakes(List<dynamic> responseBody) {
    return responseBody
        .map<LakeModel>((json) => LakeModel.fromMap(json))
        .toList();
  }

  Future<List<LakeModel>> fetchLake() async {
    try {
      var response = await Dio().get('https://script.google.com/macros/s/AKfycbydLjiyZJyXYuSwKYSwKT6RX98g2kk_pMaDH09GB1wrXg4d7IF4VRwjWHNQmxYySbb9/exec');
      if (response.statusCode == 200) {
        return decodeLakes(response.data);
      } else {
        throw Exception('Unable to fetch data from the REST API');
      }
    } catch (e) {
      print(e);
      throw Exception('Unable to fetch data from the REST API');
    }
  }
}