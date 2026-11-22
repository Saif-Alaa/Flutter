class ShopModel 
{
  List<dynamic> products;

  ShopModel({required this.products});
  factory ShopModel.fromJson(Map<String , dynamic> json)
  {
    return ShopModel(products: json["products"]);
  }
}