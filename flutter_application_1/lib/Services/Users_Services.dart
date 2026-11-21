import 'package:dio/dio.dart';
import 'package:flutter_application_1/Models/Users_Model.dart';

class UserService
{
  static Dio dio = Dio();
  static Future<UserModel> getUserService() async
  {
    Response response = await dio.get("https://randomuser.me/api/?results=12");
    return UserModel.formJson(response.data);
  }
}