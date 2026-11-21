import 'package:dio/dio.dart';
import 'package:flutter_application_1/Models/Auth_Model.dart';

class AuthService 
{
  static Dio dio = Dio();
  
  static Future<AuthModel> signUpService(String name , String email , String Phone , String password)
  async {
    try{
    Response response = await dio.post("https://elsewedyteam.runasp.net/api/Register/AddUser",
    data: 
    {
       "Name" : name,
    "Email":email,
    "Phone" : Phone,
    "Password" : password
    }
    );
     
     return AuthModel.fromJson(response.data);
  }catch (error) {
  print("SignUp Error: $error");
  throw Exception(error);
}
  }
    
  static Future<AuthModel> LoginService( String email , String password)
  async {

  try{
    Response response = await dio.post("https://elsewedyteam.runasp.net/api/Login/CheckUser",
    data: 
    {
    "Email":email,
    "Password" : password
    }
    );
     
     return AuthModel.fromJson(response.data);
  }catch(error){print("Login error : $error");
  throw Exception(error);
  }
  }
}