
import 'package:flutter/material.dart';

class PasswordCustomField extends StatefulWidget
{
 const PasswordCustomField({
    super.key,
    required this.passcon,
  });
    final TextEditingController passcon;
 
   @override
    
    State<PasswordCustomField> createState() => _PasswordCustomField();

}



class _PasswordCustomField extends  State<PasswordCustomField>  {
 
bool click = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.passcon,
       decoration: InputDecoration(
    label: Text("Password"),
    border: OutlineInputBorder(),
    prefixIcon: Icon(Icons.lock),
    suffixIcon: IconButton(onPressed: (){setState(() {
      click = !click;
    });}, icon: click ? Icon(Icons.visibility_off) : Icon(Icons.visibility) )
   ),

   obscureText: click,

   validator: (value) {
     if( value == null || value.isEmpty || value.length < 8)
     {
      return "Enter Password more than 7";
     }
   },
    
    );
  }
}
