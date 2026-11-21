class UserModel
{
  List<dynamic> results;

  UserModel({required  this.results});

  factory UserModel.formJson(Map<String , dynamic> Json)
  {
    return UserModel(results: Json["results"]);
  }
}