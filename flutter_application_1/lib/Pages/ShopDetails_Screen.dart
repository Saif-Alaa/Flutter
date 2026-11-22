import 'package:flutter/material.dart';

class ShopdetailsScreen extends StatelessWidget {
  const ShopdetailsScreen({
    super.key,
    required this.category,
    required this.desc,
    required this.img,
    required this.price,
    required this.title,
        required this.rating,

  });
  final String title;
  final String desc;
  final String img;
  final String category;
  final double price;
  final int rating;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(179, 230, 230, 230),
            boxShadow: [BoxShadow(color: Colors.black87, blurRadius: 10)],
          ),
          width: 700,
          height: 400,
          child: Column(
            children: [
              SizedBox(height: 7),

              Image.network(
                img,
                width: double.infinity,
                fit: BoxFit.cover,
                height: 150,
              ),
              SizedBox(height: 7),
              Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 7),
              Text(desc, style: TextStyle(color: Colors.black87, fontSize: 15)),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 Row(
                  children: [
                     Icon(Icons.star, color: Colors.amberAccent, size: 15),

                  Text("$rating" , style: TextStyle(fontSize: 15 , color: Colors.black) ,),
                  ],
                 ),
                  Row(
                    children: [
                      Text(
                        "\$",
                        style: TextStyle(color: Colors.green, fontSize: 15),
                      ),
                      Text(
                        "$price",
                        style: TextStyle(
                          color: const Color.fromARGB(197, 45, 44, 44),
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
