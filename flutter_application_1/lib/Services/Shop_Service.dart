import 'package:dio/dio.dart';
import 'package:flutter_application_1/Models/Shop_Model.dart';

class ShopService
 {
  static Dio dio = Dio();

  static Future<ShopModel> getproductsService() async
  {
    Response response = await dio.get("https://dummyjson.com/product");
    return ShopModel.fromJson(response.data);
  }
 }