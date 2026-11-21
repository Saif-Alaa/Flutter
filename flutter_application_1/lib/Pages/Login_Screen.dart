import 'package:flutter/material.dart';
import 'package:flutter_application_1/Custom/Email.dart';
import 'package:flutter_application_1/Custom/Password.dart';
import 'package:flutter_application_1/Pages/Users_Screen.dart';
import 'package:flutter_application_1/Providers/Auth_Provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});
      TextEditingController emailcon = TextEditingController();
   TextEditingController passcon = TextEditingController();
   
   GlobalKey<FormState> formkey = GlobalKey();
    
  @override
  Widget build(BuildContext context) {
    AuthProvider provider = Provider.of<AuthProvider>(context);
    return Scaffold(
      body: Center(
        child: Container(
          width: 450,
          height: 450,
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

              Text("Log In" , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold,),),
                                  SizedBox(height: 10,),

              Text("Welcom Bac...", style: TextStyle(fontSize: 16),),

             SizedBox(
              width: 350,
               child: Form(
                     
                key: formkey,
                child: Column(
                  children: [
                    SizedBox(height: 10,),
                   

               
                        EmailCunstomField(emailcon: emailcon),    
                                      SizedBox(height: 10,),
               
               
                        PasswordCustomField(passcon: passcon),       
                                   SizedBox(height: 10,),
               
        
                          
                          ElevatedButton(onPressed:  () async
                          {
                            if(formkey.currentState!.validate())
                            {
                           
                              
                                 await   provider.LoginProvider(emailcon.text,passcon.text);
                                 if(provider.loginModel!.status == true)
                                 {
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(provider.loginModel!.message),backgroundColor: Colors.green, duration: Duration( seconds: 2),),);
                                  Future.delayed(Duration(seconds: 2));
                                  Navigator.push(context,MaterialPageRoute(builder: (context)=> UserScreen()));
                                 }

                              
                              else{
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(provider.loginModel!.message),backgroundColor: const Color.fromARGB(255, 212, 20, 20),),);

                            }

                            }
                          }, style: ElevatedButton.styleFrom(backgroundColor: Colors.lightBlue , elevation: 3 , fixedSize: Size(350, 20)),child: Text("Log in" , style: TextStyle(color:Colors.white , fontSize: 16),))
                        
                        
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


