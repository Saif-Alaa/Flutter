import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/Cart_Screen.dart';
import 'package:flutter_application_1/Pages/ShopDetails_Screen.dart';
import 'package:flutter_application_1/Providers/Card_Provider.dart';
import 'package:flutter_application_1/Providers/Shop_Provider.dart';
import 'package:provider/provider.dart';


class ShopScreen extends StatefulWidget
{
    const ShopScreen({super.key});
      @override
      State<ShopScreen> createState()=> _ShopScreen();
    

}




class _ShopScreen extends State<ShopScreen> {



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: Consumer<ShopProvider>(
        builder: (context, value, child) {
          if (value.shopModel == null) {
            value.getProductsProvider();
            return CircularProgressIndicator();
          } else {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                mainAxisExtent: 400,
                
              ),
              itemBuilder: (context, index) {
                int id = value.shopModel!.products[index]["id"];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ShopdetailsScreen(
                          category:
                              value.shopModel!.products[index]["category"],
                          desc: value.shopModel!.products[index]["description"],
                          img: value.shopModel!.products[index]["thumbnail"],
                          price: value.shopModel!.products[index]["price"],
                          title: value.shopModel!.products[index]["title"],
                          rating: value.shopModel!.products[index]["reviews"][0]["rating"],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      left: 10,
                      right: 10,
                      top: 2,
                      bottom: 2,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(179, 230, 230, 230),
                      boxShadow: [
                        BoxShadow(color: Colors.black87, blurRadius: 10),
                      ],
                    ),
                  
                    child: Column(
                      children: [
                        SizedBox(height: 7),

                        Image.network(
                          value.shopModel!.products[index]["thumbnail"],
                          width: double.infinity,
                          fit: BoxFit.cover,
                          height: 150,
                        ),
                        SizedBox(height: 7),
                        Expanded(
                          child: Text(
                            value.shopModel!.products[index]["title"],
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 7),
                        Expanded(
                          child: Text(
                            value.shopModel!.products[index]["description"],
                            style: TextStyle(color: Colors.black87, fontSize: 15),
                          ),
                        ),
                        SizedBox(height: 20),

                        Consumer<CardProvider>(builder:(context, cart, child) {
                          bool added = cart.isInCart(id);
                           return ElevatedButton(
                          onPressed: ()
                           {
                            if(added)
                            {
                              cart.removeFromCart(id);
                            }else
                            {
                              cart.addToCart(Map<String , dynamic>.from(value.shopModel!.products[index]));
                            }
                           
                           },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: added ? Colors.redAccent : Colors.blueAccent,
                            fixedSize: Size(150, 30),
                          ),
                          child: Text( added ?
                            "Added To Card" : "Add To Card",
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                        },),
                      

                                                SizedBox(height: 20),

                      ],
                    ),
                  ),
                );
              },
            );
          }
        },


      ),
      floatingActionButton: Consumer<CardProvider>(builder:(context, value, child) {
        return FloatingActionButton(onPressed: ()
        {
          Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen()));
        },
          child: Badge(
            label: Text("${value.totalItems}"),
            child: Icon(Icons.shopping_bag),
          ),
        ); 
      },));
  }
}
