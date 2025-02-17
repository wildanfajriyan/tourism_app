import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tourism_app/data/model/tourism_detail_response.dart';
import 'package:tourism_app/data/model/tourism_list_response.dart';

class ApiService {
  static const String _baseUrl = "https://tourism-api.dicoding.dev";

  Future<TourismListResponse> getTourismList() async {
    final response = await http.get(Uri.parse('$_baseUrl/list'));

    if (response.statusCode == 200) {
      return TourismListResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load tourism list');
    }
  }

  Future<TourismDetailResponse> getToursimDetail(int id) async {
    final response = await http.get(Uri.parse('$_baseUrl/detail/$id'));

    if (response.statusCode == 200) {
      return TourismDetailResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load tourism detail');
    }
  }
}
