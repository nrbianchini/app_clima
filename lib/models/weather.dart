// ignore_for_file: unnecessary_this

class Weather {
  int? temp;
  int? tempMax;
  int? tempMin;
  String? city;
  String? date;
  String? time;
  String? windSpeedy;
  String? description;
  String? imgId;
  String? conditionSlug;

  Weather.fromJson(Map<String, dynamic> json) {
    temp = json["temp"];
    tempMax = json["max"];
    tempMin = json["min"];
    city = json["city_name"];
    date = json["date"];
    time = json["time"];
    windSpeedy = json["wind_speedy"];
    description = json["description"];
    imgId = json["img_id"];
    conditionSlug = json["condition_slug"];
  }
}
