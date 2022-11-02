// To parse this JSON data, do
//
//     final welcome = welcomeFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Episodios> episodiosFromJson(String str) => List<Episodios>.from(json.decode(str).map((x) => Episodios.fromJson(x)));

String episodiosToJson(List<Episodios> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Episodios {
    Episodios({
        required this.id,
        required this.url,
        required this.name,
        required this.season,
        required this.number,
        required this.type,
        required this.airdate,
        required this.airtime,
        required this.airstamp,
        required this.runtime,
        required this.rating,
        required this.image,
        required this.summary,
        required this.links,
    });

    int id;
    String url;
    String name;
    int season;
    int number;
    Type? type;
    DateTime airdate;
    Airtime? airtime;
    DateTime airstamp;
    int runtime;
    Rating rating;
    Images image;
    String summary;
    Links links;

    factory Episodios.fromJson(Map<String, dynamic> json) => Episodios(
        id: json["id"],
        url: json["url"],
        name: json["name"],
        season: json["season"],
        number: json["number"],
        type: typeValues.map[json["type"]],
        airdate: DateTime.parse(json["airdate"]),
        airtime: airtimeValues.map[json["airtime"]],
        airstamp: DateTime.parse(json["airstamp"]),
        runtime: json["runtime"],
        rating: Rating.fromMap(json["rating"]),
        image: Images.fromMap(json["image"]),
        summary: json["summary"],
        links: Links.fromMap(json["_links"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "name": name,
        "season": season,
        "number": number,
        "type": typeValues.reverse[type],
        "airdate": "${airdate.year.toString().padLeft(4, '0')}-${airdate.month.toString().padLeft(2, '0')}-${airdate.day.toString().padLeft(2, '0')}",
        "airtime": airtimeValues.reverse[airtime],
        "airstamp": airstamp.toIso8601String(),
        "runtime": runtime,
        "rating": rating.toMap(),
        "image": image.toMap(),
        "summary": summary,
        "_links": links.toMap(),
    };
}

enum Airtime { THE_2200, THE_2100 }

final airtimeValues = EnumValues({
    "21:00": Airtime.THE_2100,
    "22:00": Airtime.THE_2200
});

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

class Links {
    Links({
        required this.self,
    });

    Self self;

    factory Links.fromMap(Map<String, dynamic> json) => Links(
        self: Self.fromMap(json["self"]),
    );

    Map<String, dynamic> toMap() => {
        "self": self.toMap(),
    };
}

class Self {
    Self({
        required this.href,
    });

    String href;

    factory Self.fromMap(Map<String, dynamic> json) => Self(
        href: json["href"],
    );

    Map<String, dynamic> toMap() => {
        "href": href,
    };
}

class Rating {
    Rating({
        required this.average,
    });

    double average;

    factory Rating.fromMap(Map<String, dynamic> json) => Rating(
        average: json["average"].toDouble(),
    );

    Map<String, dynamic> toMap() => {
        "average": average,
    };
}

enum Type { REGULAR }

final typeValues = EnumValues({
    "regular": Type.REGULAR
});

class EnumValues<T> {
    Map<String, T> map;
   late  Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
