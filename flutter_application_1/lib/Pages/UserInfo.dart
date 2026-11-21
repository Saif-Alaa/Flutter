import 'package:flutter/material.dart';

class Userinfo extends StatelessWidget {
  const Userinfo({super.key , required this.Address , required this.Email , required this.Name , required this.urlImg});
  final String urlImg;
  final String Name;
  final String Email;
  final String Address;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          width: 450,
          height: 450,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: const Color.fromARGB(26, 175, 28, 28)),
          child: Column(
            children: [
                              SizedBox(height: 10,),

               CircleAvatar(backgroundImage: NetworkImage(urlImg), radius: 60,),
               Text(Name , style: TextStyle(fontSize: 17 , fontWeight: FontWeight.bold,)),

                 ListTile(
                  title: Text("Email"),
                  subtitle: Text(Email),
                  leading: Icon(Icons.email , size: 17,color: Colors.blueAccent,),
                ),

                SizedBox(height: 5,),
                Text("_____________________________________________"),
                 SizedBox(height: 5,),

                 
    ListTile(
                  title: Text("Address"),
                  subtitle: Text(Address),
                  leading: Icon(Icons.location_on , size: 17, color: Colors.blue,),
                ),
            
            ],
            
          ),
        ),
      ),  
    );
  }
}