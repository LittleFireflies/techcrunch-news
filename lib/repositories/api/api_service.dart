import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tech_crunch_news/utils/exceptions.dart';

import '../models/news_response.dart';

class ApiService {
  final http.Client _client;

  ApiService(http.Client client) : _client = client;

  Future<NewsResponse> getTopHeadlineNews() async {
    final response = await _client.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=31b1d418811249f0970f756bca4cf906'));

    if (response.statusCode == 200) {
      return NewsResponse.fromJson(json.decode(response.body));
    } else {
      throw const ServerException();
    }
  }
}
