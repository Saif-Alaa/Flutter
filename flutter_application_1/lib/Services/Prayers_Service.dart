import 'package:dio/dio.dart';
import 'package:flutter_application_1/Models/Prayers_Models.dart';

class PrayersService
{
  static Dio dio = Dio();

  static Future<PrayersModels> getPrayersService() async
  {
    Response response = await dio.get("https://api.aladhan.com/v1/timingsByCity/15-11-2026?city=Giza&country=Egypt&method=2");
    return PrayersModels.fromJson(response.data);
  }
}