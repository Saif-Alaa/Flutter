import 'package:flutter/material.dart';
import 'package:flutter_application_1/Custom/Email.dart';
import 'package:flutter_application_1/Custom/Password.dart';
import 'package:flutter_application_1/Pages/Login_Screen.dart';
import 'package:flutter_application_1/Providers/Auth_Provider.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
   SignUpScreen({super.key});
   TextEditingController namecon = TextEditingController();
      TextEditingController emailcon = TextEditingController();
   TextEditingController passcon = TextEditingController();
    TextEditingController ConfirmPasscon = TextEditingController();

   TextEditingController phonecon = TextEditingController();
   
   GlobalKey<FormState> formkey = GlobalKey();
    
  @override
  Widget build(BuildContext context) {
    AuthProvider provider = Provider.of<AuthProvider>(context);
    return Scaffold(
      body: Center(
        child: Container(
          width: 700,
          height: 600,
          margin: EdgeInsets.all(2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white10,
            boxShadow: 
            [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
              )
            ]
          ),
          child: Column(
            children: [
                    SizedBox(height: 10,),

              Icon(Icons.account_box , size: 30, color: Colors.blueAccent,),
                                  SizedBox(height: 10,),

              Text("Sign Up" , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold,),),
                                  SizedBox(height: 10,),

              Text("Create Your Account...", style: TextStyle(fontSize: 16),),

             SizedBox(
              width: 450,
               child: Form(
                     
                key: formkey,
                child: Column(
                  children: [
                    SizedBox(height: 10,),
                    TextFormField(
                       controller: namecon,
                       decoration: InputDecoration(
                        label: Text("Name"),
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person),
                       ),
                       validator: (value) {
                         if(value==null || value.isEmpty){ return "Enter name";}
                       },
                    ),
                                        SizedBox(height: 10,),


                          TextFormField(
                       controller: phonecon,
                       decoration: InputDecoration(
                        label: Text("Phone"),
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.phone),
                       ),
                       validator: (value) {
                         if(value==null || value.isEmpty || value.length != 11){ return "Enter Phone 11 number";}
                       },
                    ),
                                        SizedBox(height: 10,),
                                        

               
                        EmailCunstomField(emailcon: emailcon),                  SizedBox(height: 10,),
               
               
                        PasswordCustomField(passcon: passcon),                  SizedBox(height: 10,),
               
               
                        ConfirmPasswordField(ConfirmPasscon: ConfirmPasscon , Passcon:  passcon,),
                                          SizedBox(height: 10,),
                          
                          ElevatedButton(onPressed:  () async
                          {
                            if(formkey.currentState!.validate())
                            {
                                  
                              await provider.SignUpProvider(namecon.text, emailcon.text, phonecon.text, passcon.text);
                                
                               if(provider.signupModel!.status == true) 
                               {  
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(provider.signupModel!.message), backgroundColor:  Colors.green));
                                Navigator.push(context,MaterialPageRoute(builder: (context) => LoginScreen()));

                               }else
                               {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(provider.signupModel!.message), backgroundColor:  Colors.redAccent));

                               }
                            }
                          }, style: ElevatedButton.styleFrom(backgroundColor: Colors.lightBlue , elevation: 3 , fixedSize: Size(350, 20)),child: Text("Sign Up" , style: TextStyle(color:Colors.white , fontSize: 16),))
                        
                        
                        ],
                )),
             )
            ],
          ),
        ),
      ),
    );
  }
}



class ConfirmPasswordField extends StatefulWidget
{  const ConfirmPasswordField({
    super.key,
    required this.ConfirmPasscon,
    required this.Passcon
  });

  final TextEditingController ConfirmPasscon;
  final TextEditingController Passcon;

    @override
    
    State<ConfirmPasswordField> createState()=> _ConfirmPasswordField();

}


class _ConfirmPasswordField extends  State<ConfirmPasswordField>  {
bool click = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.ConfirmPasscon,
    
       decoration: InputDecoration(
    label: Text("Confirm Password"),
    border: OutlineInputBorder(),
    prefixIcon: Icon(Icons.lock),
        suffixIcon: IconButton(onPressed: (){setState(() {
      click = !click;
    });}, icon: click ? Icon(Icons.visibility_off) : Icon(Icons.visibility) )
                         ),

                         
         obscureText: click,

   validator: (value) {
     if( value == null || value.isEmpty || value.length < 8 || widget.ConfirmPasscon.text != widget.Passcon.text)
     {
      return "Password not Matchy";
     }
   }
    );
  }
}

