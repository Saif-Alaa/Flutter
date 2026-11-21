import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/Prayers_Models.dart';
import 'package:flutter_application_1/Services/Prayers_Service.dart';

class PrayersProvider extends ChangeNotifier
{
  PrayersModels? prayersModels;

  getPrayersProvider() async
  {
    prayersModels = await PrayersService.getPrayersService();
    notifyListeners();
  }
}