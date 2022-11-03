// To parse this JSON data, do
//
//     final welcome = welcomeFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<SeasonModel> seasonModelFromJson(String str) =>  List<SeasonModel>.from(json.decode(str).map((x) => SeasonModel.fromJson(x)));

String seasonModelToJson(List<SeasonModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

var imageDefault = '{ "medium": "https://cdn-icons-png.flaticon.com/128/3875/3875148.png", "original":  "https://cdn-icons-png.flaticon.com/128/3875/3875148.png" }';

var jsonImageDefault = json.decode(imageDefault);
class SeasonModel {
    SeasonModel({
        required this.id,
        required this.url,
        required this.number,
        required this.name,
        required this.episodeOrder,
        required this.image,
        
    });

    int id;
    String url;
    int number;
    String name;
    int episodeOrder;
    dynamic webChannel;
    Images image;

    //final Images imageDefault = Images(medium:'https://cdn-icons-png.flaticon.com/128/3875/3875148.png',original: 'https://cdn-icons-png.flaticon.com/128/3875/3875148.png');

    factory SeasonModel.fromJson(Map<String, dynamic> json) => SeasonModel(
        id: json["id"]??'',
        url: json["url"]??'',
        number: json["number"]??0,
        name: json["name"]??'',
        episodeOrder: json["episodeOrder"]??0,
        image: json["image"] != null?Images.fromMap(json["image"]): Images.fromMap(jsonImageDefault));
    

    Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "number": number,
        "name": name,
        "episodeOrder": episodeOrder,
        "image": image.toMap(),
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
        medium: json["medium"]??'https://cdn-icons-png.flaticon.com/128/3875/3875148.png',
        original: json["original"]??'',
    );

    Map<String, dynamic> toMap() => {
        "medium": medium,
        "original": original,
    };
}










