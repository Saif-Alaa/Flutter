import 'package:flutter/material.dart';

class NewsdetailsScreen extends StatelessWidget {
  const NewsdetailsScreen({
    super.key,
    required this.Author,
    required this.Desc,
    required this.Img,
    required this.NameSource,
    required this.Title,
    required this.publishedAt,
  });

  final String Title;
  final String Desc;
  final String Author;
  final String Img;
  final String NameSource;
  final String publishedAt;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          width: 700,
          height: 500,
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.all(25),
          decoration: BoxDecoration(
            color: const Color.fromARGB(171, 187, 187, 187),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [BoxShadow(color: Colors.black45, blurRadius: 10)],
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(2),
                child: Image.network(
                  Img,
                  width: double.infinity,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Icon(Icons.source),
                  SizedBox(width: 10),

                  Text(
                    NameSource,
                    style: TextStyle(color: Colors.black54, fontSize: 16),
                  ),
                ],
              ),
              SizedBox(height: 20),

              Text(Title, style: TextStyle(color: Colors.black, fontSize: 17)),
              SizedBox(height: 20),

              Text(Desc),
              SizedBox(height: 20),

              Row(
                children: [
                  Icon(
                    Icons.date_range_outlined,
                    size: 15,
                    color: Colors.black54,
                  ),                  SizedBox(width: 10),

                  Text(
                    publishedAt,
                    style: TextStyle(fontSize: 15, color: Colors.black54),
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
