import 'package:dio/dio.dart';

class NewsModels 
{
  String status;
  List<dynamic> articles;
  NewsModels({required this.status , required this.articles});

  factory NewsModels.fromJson(Map<String , dynamic> json)
  {
    return NewsModels(status: json["status"], articles: json["articles"]);
  }
}