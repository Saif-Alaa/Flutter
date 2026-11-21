import 'package:dio/dio.dart';
import 'package:flutter_application_1/Models/News_Models.dart';

class NewsServices 
{
  static Dio dio = Dio();
  static Future<NewsModels> getNewsService() async
  {
    Response response = await dio.get("https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=a410b1724f84452c8df8a810efe34642");
    return NewsModels.fromJson(response.data);
  }
}