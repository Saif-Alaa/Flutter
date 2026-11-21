class PrayersModels
 {
   Map<String , dynamic> data;
   PrayersModels({required this.data});

   factory PrayersModels.fromJson(Map<String , dynamic> json)
   {
    return PrayersModels(data: json["data"]);
   }
 }