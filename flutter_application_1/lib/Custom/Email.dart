
import 'package:flutter/material.dart';

class EmailCunstomField extends StatelessWidget {
  const EmailCunstomField({
    super.key,
    required this.emailcon,
  });

  final TextEditingController emailcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
                         controller: emailcon,
                         decoration: InputDecoration(
    label: Text("Email"),
    border: OutlineInputBorder(),
    prefixIcon: Icon(Icons.person),
                         ),
                         validator: (value) {
                           if(value == null || value.isEmpty || !value.contains("@"))
                           {
                            return "Enter Corect Eamil";
                           }
                         },
                      );
  }
}