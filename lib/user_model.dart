import 'dart:convert';

import 'package:flutter/cupertino.dart';

List<UserModel> userModelFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));


String userModelToJson(List<UserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
  UserModel({
    required this.id,
    required this.name,
    required this.img,
    required this.schedule,
    required this.genres,
    required this.summary,
    required this.links


    
  });

  int id;
  String name;
  Images img;
  Schedule schedule;
  List<Genre> genres;
  String summary;
  Links links;
  



 

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        img: Images.fromMap(json["image"]),
        schedule: Schedule.fromMap(json["schedule"]),
        genres: List<Genre>.from(json["genres"].map((x) => genreValues.map[x])),
        summary: json["summary"],
        links: Links.fromMap(json["_links"]),




        
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": img.toMap(),
        "genres": List<dynamic>.from(genres.map((x) => genreValues.reverse[x])),
        "summary": summary,
        "schedule": schedule.toMap(),
         "_links": links.toMap(),



      };

  
}

class Images {
    Images({
        required this.medium,
        required this.original,
    });

    String medium;
    String original;

    factory Images.fromMap(Map<String, dynamic> json) => Images(
        medium: json["medium"],
        original: json["original"],
        
    );

    Map<String, dynamic> toMap() => {
        "medium": medium,
        "original": original,
        
    };
}

class Schedule {
    Schedule({
        required this.time,
        required this.days,
    });

    Time? time;
    List<Day> days;

    factory Schedule.fromMap(Map<String, dynamic> json) => Schedule(
        time: timeValues.map[json["time"]],
        days: List<Day>.from(json["days"].map((x) => dayValues.map[x])),
    );

    Map<String, dynamic> toMap() => {
        "time": timeValues.reverse[time],
        "days": List<dynamic>.from(days.map((x) => dayValues.reverse[x])),
    };
}

enum Day { THURSDAY, TUESDAY, FRIDAY, SUNDAY, WEDNESDAY, SATURDAY, MONDAY }

final dayValues = EnumValues({
    "Friday": Day.FRIDAY,
    "Monday": Day.MONDAY,
    "Saturday": Day.SATURDAY,
    "Sunday": Day.SUNDAY,
    "Thursday": Day.THURSDAY,
    "Tuesday": Day.TUESDAY,
    "Wednesday": Day.WEDNESDAY
});

enum Time { THE_2200, THE_2100, THE_2000, EMPTY, THE_1200, THE_2130, THE_1300, THE_2030, THE_0900, THE_2230, THE_2300, THE_2330 }

final timeValues = EnumValues({
    "": Time.EMPTY,
    "09:00": Time.THE_0900,
    "12:00": Time.THE_1200,
    "13:00": Time.THE_1300,
    "20:00": Time.THE_2000,
    "20:30": Time.THE_2030,
    "21:00": Time.THE_2100,
    "21:30": Time.THE_2130,
    "22:00": Time.THE_2200,
    "22:30": Time.THE_2230,
    "23:00": Time.THE_2300,
    "23:30": Time.THE_2330
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

     EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}

enum Genre { DRAMA, SCIENCE_FICTION, THRILLER, ACTION, CRIME, HORROR, ROMANCE, ADVENTURE, ESPIONAGE, MUSIC, MYSTERY, SUPERNATURAL, FANTASY, FAMILY, ANIME, COMEDY, HISTORY, MEDICAL, LEGAL, WESTERN, WAR, SPORTS }

final genreValues = EnumValues({
    "Action": Genre.ACTION,
    "Adventure": Genre.ADVENTURE,
    "Anime": Genre.ANIME,
    "Comedy": Genre.COMEDY,
    "Crime": Genre.CRIME,
    "Drama": Genre.DRAMA,
    "Espionage": Genre.ESPIONAGE,
    "Family": Genre.FAMILY,
    "Fantasy": Genre.FANTASY,
    "History": Genre.HISTORY,
    "Horror": Genre.HORROR,
    "Legal": Genre.LEGAL,
    "Medical": Genre.MEDICAL,
    "Music": Genre.MUSIC,
    "Mystery": Genre.MYSTERY,
    "Romance": Genre.ROMANCE,
    "Science-Fiction": Genre.SCIENCE_FICTION,
    "Sports": Genre.SPORTS,
    "Supernatural": Genre.SUPERNATURAL,
    "Thriller": Genre.THRILLER,
    "War": Genre.WAR,
    "Western": Genre.WESTERN
});

class Links {
    Links({
        required this.self,
        required this.previousepisode,
        required this.nextepisode,
    });

    Previousepisode self;
    Previousepisode? previousepisode;
    Previousepisode? nextepisode;

    factory Links.fromMap(Map<String, dynamic> json) => Links(
        self: Previousepisode.fromMap(json["self"]),
        previousepisode: Previousepisode.fromMap(json["previousepisode"]),
        nextepisode: json["nextepisode"] == null ? null : Previousepisode.fromMap(json["nextepisode"]),
    );

    Map<String, dynamic> toMap() => {
        "self": self.toMap(),
        "previousepisode": previousepisode?.toMap(),
        "nextepisode": nextepisode == null ? null : nextepisode?.toMap(),
    };
}

class Previousepisode {
    Previousepisode({
        required this.href,
    });

    String href;

    factory Previousepisode.fromMap(Map<String, dynamic> json) => Previousepisode(
        href: json["href"],
    );

    Map<String, dynamic> toMap() => {
        "href": href,
    };
}



