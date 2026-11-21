import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/News_Models.dart';
import 'package:flutter_application_1/Services/News_Services.dart';

class NewsProvider extends ChangeNotifier
{
  NewsModels? newsModels;

  getNewsProvider() async
  {
    newsModels = await NewsServices.getNewsService();
         notifyListeners();

  }
}