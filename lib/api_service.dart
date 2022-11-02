import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:listaseries/episode_model.dart';
import 'package:listaseries/seasonepisodemodel.dart';
import 'package:listaseries/seasonmodel.dart';
import 'constants.dart';
import 'user_model.dart';

class ApiService {
  Future<List<UserModel>?> getUsers(String? query) async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.searchEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<UserModel> model = userModelFromJson(response.body);
        if(query !=null){
          model = model.where((element) => element.name.toLowerCase().contains(query.toLowerCase())).toList();
        }

        return model;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<List<Episodios>?> getEpisodios() async{
    try{
       var url2 = Uri.parse(ApiConstants.baseUrl + ApiConstants.episodiosEndPoint);
       var response2 = await http.get(url2);
       if(response2.statusCode == 200){
        List<Episodios> modelepisodios = episodiosFromJson(response2.body);
        return modelepisodios;
       }
    }catch(e){
      log(e.toString());
    }
  }

  Future<List<SeasonModel>?> getSeasons(String idserie) async{
     String listatemporadas ='/shows/$idserie/seasons';
     const String urlbase = 'https://api.tvmaze.com';
    try{
       var url = Uri.parse(urlbase +listatemporadas);
       var response = await http.get(url);
       if(response.statusCode == 200){
           List<SeasonModel> modelseasons = seasonModelFromJson(response.body);

        return modelseasons;
        
        
       

      
       }
    }catch(e){
      log(e.toString());
    }
  }

  Future<List<SeasonEpisodeModel>?> getSeasonsEpisodes(String idseason) async{
    String listaeptemp = '/seasons/$idseason/episodes';
    try{
       var url4 = Uri.parse(ApiConstants.baseUrl + listaeptemp);
       var response4 = await http.get(url4);
       if(response4.statusCode == 200){
        List<SeasonEpisodeModel> modelepseasons = seasonEpisodeModelFromJson(response4.body);
        return modelepseasons;
       }
    }catch(e){
      log(e.toString());
    }
  }
}