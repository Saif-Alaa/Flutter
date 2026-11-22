import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/Shop_Model.dart';
import 'package:flutter_application_1/Services/Shop_Service.dart';

class ShopProvider extends ChangeNotifier
{
  ShopModel? shopModel;

  getProductsProvider() async
  {
    shopModel = await ShopService.getproductsService();
    notifyListeners();
  }
}