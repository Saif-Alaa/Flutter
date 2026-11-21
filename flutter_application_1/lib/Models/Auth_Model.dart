class AuthModel
{
  bool status;
  String message;
   
   AuthModel({required this.message , required this.status});

   factory AuthModel.fromJson(Map<String , dynamic> json)
   {
    return AuthModel(message: json["message"], status: json["status"]);
   }

}