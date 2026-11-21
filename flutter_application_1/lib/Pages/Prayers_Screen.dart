import 'package:flutter/material.dart';
import 'package:flutter_application_1/Providers/Prayers_Provider.dart';
import 'package:provider/provider.dart';

class PrayersScreen extends StatelessWidget {
  const PrayersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("PrayersScreen"), centerTitle: true),
      body: Consumer<PrayersProvider>(
        builder: (context, value, child) {
          if (value.prayersModels == null) {
            value.getPrayersProvider();
            return CircularProgressIndicator();
          } else {
            return ListView.builder(
              itemCount: value.prayersModels!.data["timings"].length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(30),
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 133, 128, 128),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 22, 16, 16),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: ListTile(
                    leading: Icon(Icons.mosque_sharp , color: Colors.black,),
                    title: Text(
                      value.prayersModels!.data["timings"].keys.toList()[index],
                      style: TextStyle(color: Colors.black, fontSize: 17),
                    ),
                    subtitle: Row(
                      children: [
                        Icon(
                          Icons.av_timer_outlined,
                          color: Colors.black,
                          size: 18,
                        ),
                        SizedBox(width: 7),
                        Text(
                          value.prayersModels!.data["timings"].values
                              .toList()[index],
                          style: TextStyle(color: Colors.black, fontSize: 17),
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
