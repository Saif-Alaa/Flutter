import 'package:flutter/material.dart';

class CardProvider extends ChangeNotifier
{
  Map<int , Map<String , dynamic>> CartItems = {};

  void addToCart(Map<String , dynamic> product)
  {
    int id = product["id"];
    CartItems[id] = {...product, "quantity" : 1};
  notifyListeners();
  }

  void removeFromCart(int id)
  {
    CartItems.remove(id);
    notifyListeners();
  }


  bool isInCart(int id)
  {
    return CartItems.containsKey(id);
  }

  void increaseQuantity(int id)
  {
    CartItems[id]!["quantity"]++;
    notifyListeners();
  }

  void decreaseQuantity(int id)
  {
    if(CartItems[id]!["quantity"] > 1)
    {
      CartItems[id]!["quantity"]--;
      notifyListeners();
    }else
    {
      removeFromCart(id);
    }
  }


  int get totalItems
  {
    int total = 0;

    for(var item in CartItems.values)
    {
      total += item["quantity"] as int;
    }
    return total;
  }
  

  double get totalPrice
  {
    double total = 0;
    for(var item in CartItems.values)
    {
      total += (item["price"] as num) * (item["quantity"] as int);
    }
    return total;
  }
}