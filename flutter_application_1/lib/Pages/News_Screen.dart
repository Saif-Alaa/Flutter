import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/NewsDetails_Screen.dart';
import 'package:flutter_application_1/Providers/News_Provider.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<NewsProvider>(
        builder: (context, value, child) {
          if (value.newsModels == null) {
            value.getNewsProvider();
            return CircularProgressIndicator();
          } else {
            return ListView.builder(
              itemCount: value.newsModels!.articles.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> NewsdetailsScreen(Author: value.newsModels!.articles[index]["author"], Desc: value.newsModels!.articles[index]["description"], Img: value.newsModels!.articles[index]["urlToImage"], NameSource: value.newsModels!.articles[index]["source"]["name"], Title: value.newsModels!.articles[index]["title"], publishedAt: value.newsModels!.articles[index]["publishedAt"]) ));
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      top: 20,
                      left: 70,
                      right: 70,
                      bottom: 50,
                    ),
                    padding: EdgeInsets.all(5),
                    width: double.infinity,
                    height: 450,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 219, 218, 218),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          color: const Color.fromARGB(255, 66, 66, 66),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Image.network(
                          value.newsModels!.articles[index]["urlToImage"],
                          width: double.infinity,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 20),
                        SizedBox(height: 20),
                  
                        Text(
                          value.newsModels!.articles[index]["title"],
                          style: TextStyle(
                            color: const Color.fromARGB(255, 135, 135, 135),
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20),
                  
                        Expanded(
                          child: Text(
                            value.newsModels!.articles[index]["description"],
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
