// File: lib/services/news_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newsapp/utils/constants.dart';

class Article {
  final String title, description, url, imageUrl;

  Article({required this.title, required this.description, required this.url, required this.imageUrl});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'] ?? 'No Title',
      description: json['description'] ?? 'No Description',
      url: json['url'] ?? '',
      imageUrl: json['urlToImage'] ?? '',
    );
  }
}

class NewsService {
  final String apiKey = myApiKey;
  final String baseUrl = 'https://newsapi.org/v2';

  Future<List<Article>> fetchTopHeadlines() async {
    final response = await http.get(Uri.parse('$baseUrl/top-headlines?country=us&apiKey=$apiKey'));
    return _parseResponse(response);
  }

  Future<List<Article>> fetchArticlesByCategory(String category) async {
    final response = await http.get(Uri.parse('$baseUrl/top-headlines?category=$category&apiKey=$apiKey'));
    return _parseResponse(response);
  }

  Future<List<Article>> searchArticles(String query) async {
    final response = await http.get(Uri.parse('$baseUrl/everything?q=$query&apiKey=$apiKey'));
    return _parseResponse(response);
  }

  List<Article> _parseResponse(http.Response response) {
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return (data['articles'] as List).map((json) => Article.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load news');
    }
  }
}
