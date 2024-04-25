import 'dart:convert';
import 'package:api_fetching/model/fetch_model.dart';
import 'package:http/http.dart' as http;

class Services {
  Future<List<ApiFetchModel>> getData() async {
    
    final response = await http.get(Uri.parse('https:fakestoreapi.com/products'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map((json) => ApiFetchModel.fromJson(json)).toList();
    } 
    else{
      throw Exception('unable to fetch data ');
    }
  }
}