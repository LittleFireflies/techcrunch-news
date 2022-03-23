import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tech_crunch_news/repositories/models/error_response.dart';
import 'package:tech_crunch_news/utils/exceptions.dart';

import '../models/news_response.dart';

class ApiService {
  final http.Client _client;

  ApiService(http.Client client) : _client = client;

  static const baseUrl = 'https://newsapi.org/v2/';
  static const _apiKey = '31b1d418811249f0970f756bca4cf906';
  static const _techCrunchSource = 'sources=techcrunch';

  Future<NewsResponse> getTopHeadlineNews() async {
    final response = await _client.get(Uri.parse(
        '${baseUrl}top-headlines?apiKey=$_apiKey&$_techCrunchSource'));

    if (response.statusCode == 200) {
      return NewsResponse.fromJson(json.decode(response.body));
    } else {
      final errorResponse = ErrorResponse.fromJson(json.decode(response.body));
      throw ServerException(message: errorResponse.message);
    }
  }

  Future<NewsResponse> searchNews({required String query}) async {
    final response = await _client.get(Uri.parse(
        '${baseUrl}top-headlines?apiKey=$_apiKey&$_techCrunchSource&q=$query'));

    if (response.statusCode == 200) {
      return NewsResponse.fromJson(json.decode(response.body));
    } else {
      final errorResponse = ErrorResponse.fromJson(json.decode(response.body));
      throw ServerException(message: errorResponse.message);
    }
  }
}
