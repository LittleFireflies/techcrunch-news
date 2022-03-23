import 'dart:async';

import 'package:dio/dio.dart';
import 'package:tech_crunch_news/api/models/news_response.dart';

class ApiService {
  final Dio _dioClient;

  ApiService(Dio dio) : _dioClient = dio;

  static const baseUrl = 'https://newsapi.org/v2/';
  static const _apiKey = '31b1d418811249f0970f756bca4cf906';
  static const _techCrunchSource = 'sources=techcrunch';

  Future<NewsResponse> getTopHeadlineNews() async {
    final response = await _dioClient
        .get('${baseUrl}top-headlines?apiKey=$_apiKey&$_techCrunchSource');

    return NewsResponse.fromJson(response.data);
  }

  Future<NewsResponse> searchNews({required String query}) async {
    final response = await _dioClient.get(
        '${baseUrl}everything?apiKey=$_apiKey&language=en&$_techCrunchSource&q=$query');

    return NewsResponse.fromJson(response.data);
  }
}
