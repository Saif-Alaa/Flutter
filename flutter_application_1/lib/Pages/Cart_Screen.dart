import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/Users_Screen.dart';
import 'package:flutter_application_1/Providers/Card_Provider.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:  Consumer<CardProvider>(
        builder: (context, value, child) {
          if(value.CartItems.isEmpty)
          {
            return Center(child: Column(children:
             [
              Text("No Date") ,
            ],
          ),
                );
          }else
          {
            return Column(
              children: [
 Expanded(
   child: ListView.builder(
                itemCount: value.CartItems.length,
                itemBuilder:(context, index)
                {
                  return ListTile(
                    leading: Image.network(value.CartItems.values.toList()[index]["thumbnail"],   width: 60,
                              height: 60,
                              fit: BoxFit.cover,),
                    title: Text(value.CartItems.values.toList()[index]["title"]),
                      
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Price : ${value.CartItems.values.toList()[index]["price"]}"),
                        Row(children: 
                        [
                                              IconButton(onPressed: (){
                                                 value.decreaseQuantity(value.CartItems.values.toList()[index]["id"]);
                      }, icon: Icon(Icons.remove_circle , color: Colors.redAccent,)),
                          SizedBox(width: 5,),
                            Text("${value.CartItems.values.toList()[index]["quantity"]}"),
                                              SizedBox(width: 5,),
                                              IconButton(onPressed: ()
                                              {
                                                value.increaseQuantity(value.CartItems.values.toList()[index]["id"]);
                                              }, icon: Icon(Icons.add_circle , color: Colors.green,))
                      
                        ],)
                      ],
                    ),
                      
                    
                  );
                },),
 ),

              Row(children: [
                Icon(Icons.money_off),
                              Text("Total Price : ${value.totalPrice}"),
    
                            
                            ],),

                            Text("Total items : ${value.totalItems}")
              
              ],
             
            );
          }
        },
      
      ),
    );
  }
}