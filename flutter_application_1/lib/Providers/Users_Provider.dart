import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/Users_Model.dart';
import 'package:flutter_application_1/Services/Users_Services.dart';

class UsersProvider extends ChangeNotifier 
{
  UserModel? userModel;

  getUserProvider()async
  {
     userModel = await UserService.getUserService();
     notifyListeners();
  }
}