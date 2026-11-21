import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/Auth_Model.dart';
import 'package:flutter_application_1/Services/Auth_Service.dart';

class AuthProvider extends ChangeNotifier
{
  AuthModel? loginModel;
  AuthModel? signupModel;

  SignUpProvider(String name , String email , String Phone , String password)
   async
   {
    signupModel = await AuthService.signUpService(name, email, Phone, password);
   }



   LoginProvider(String email , String password)
    async
    {
      loginModel = await AuthService.LoginService(email, password);
    }
}