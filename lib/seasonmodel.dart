// To parse this JSON data, do
//
//     final welcome = welcomeFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<SeasonModel> seasonModelFromJson(String str) => List<SeasonModel>.from(json.decode(str).map((x) => SeasonModel.fromJson(x)));

String seasonModelToJson(List<SeasonModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SeasonModel {
    SeasonModel({
        required this.id,
        required this.url,
        required this.number,
        required this.name,
        required this.episodeOrder,
        required this.premiereDate,
        required this.endDate,
        required this.network,
        required this.webChannel,
        required this.image,
        required this.summary,
        required this.links,
    });

    int id;
    String url;
    int number;
    String name;
    int episodeOrder;
    DateTime premiereDate;
    DateTime endDate;
    Network network;
    dynamic webChannel;
    Images image;
    String summary;
    Links links;

    factory SeasonModel.fromJson(Map<String, dynamic> json) => SeasonModel(
        id: json["id"],
        url: json["url"],
        number: json["number"],
        name: json["name"],
        episodeOrder: json["episodeOrder"],
        premiereDate: DateTime.parse(json["premiereDate"]),
        endDate: DateTime.parse(json["endDate"]),
        network: Network.fromMap(json["network"]),
        webChannel: json["webChannel"],
        image: Images.fromMap(json["image"]),
        summary: json["summary"],
        links: Links.fromMap(json["_links"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "number": number,
        "name": name,
        "episodeOrder": episodeOrder,
        "premiereDate": "${premiereDate.year.toString().padLeft(4, '0')}-${premiereDate.month.toString().padLeft(2, '0')}-${premiereDate.day.toString().padLeft(2, '0')}",
        "endDate": "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
        "network": network.toMap(),
        "webChannel": webChannel,
        "image": image.toMap(),
        "summary": summary,
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

class Network {
    Network({
        required this.id,
        required this.name,
        required this.country,
        required this.officialSite,
    });

    int id;
    String name;
    Country country;
    String officialSite;

    factory Network.fromMap(Map<String, dynamic> json) => Network(
        id: json["id"],
        name: json["name"],
        country: Country.fromMap(json["country"]),
        officialSite: json["officialSite"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "country": country.toMap(),
        "officialSite": officialSite,
    };
}

class Country {
    Country({
        required this.name,
        required this.code,
        required this.timezone,
    });

    String name;
    String code;
    String timezone;

    factory Country.fromMap(Map<String, dynamic> json) => Country(
        name: json["name"],
        code: json["code"],
        timezone: json["timezone"],
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "code": code,
        "timezone": timezone,
    };
}
