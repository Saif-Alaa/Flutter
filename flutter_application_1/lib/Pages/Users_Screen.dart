import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/News_Screen.dart';
import 'package:flutter_application_1/Pages/Prayers_Screen.dart';
import 'package:flutter_application_1/Pages/Shop_Screen.dart';
import 'package:flutter_application_1/Pages/UserInfo.dart';
import 'package:flutter_application_1/Providers/Users_Provider.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UsersProvider provider = Provider.of<UsersProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Users")),
      body: Consumer<UsersProvider>(
        builder: (context, value, child) {
          if (value.userModel == null) {
            value.getUserProvider();

            return Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: value.userModel!.results.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(top: 5, bottom: 5, left: 60, right: 60),
                padding: EdgeInsets.all(2),

                decoration: BoxDecoration(
                  color: const Color.fromARGB(26, 84, 74, 74),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Userinfo(
                          Address:
                              "${value.userModel!.results[index]["location"]["city"]} - ${value.userModel!.results[index]["location"]["state"]} - ${value.userModel!.results[index]["location"]["country"]} ${value.userModel!.results[index]["location"]["street"]["name"]}",
                          Email: "${value.userModel!.results[index]["email"]}",
                          Name:
                              "${value.userModel!.results[index]["name"]["first"]} ${value.userModel!.results[index]["name"]["last"]}",
                          urlImg:
                              "${value.userModel!.results[index]["picture"]["thumbnail"]}",
                        ),
                      ),
                    );
                  },
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                      value.userModel!.results[index]["picture"]["thumbnail"],
                    ),
                    radius: 50,
                  ),
                  title: Row(
                    children: [
                      Text(value.userModel!.results[index]["name"]["first"]),
                      SizedBox(width: 5),
                      Text(value.userModel!.results[index]["name"]["last"]),
                    ],
                  ),

                  subtitle: Text(value.userModel!.results[index]["email"]),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          provider.getUserProvider();
        },
        child: Icon(Icons.replay),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NewsScreen()),
            );
          }
                 
                 if(index == 1)
                 {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ShopScreen()));
                 }
                   if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PrayersScreen()),
            );
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.mosque_sharp, size: 17, color: Colors.black12),
            label: "Prayers",
          ),

            
          BottomNavigationBarItem(icon: Icon(Icons.shopify_rounded , size: 17 , color: Colors.black12,) , label: "Shop"),
     
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper, size: 17, color: Colors.black12),
            label: "News",
          ),
        ],
      ),
    );
  }
}
