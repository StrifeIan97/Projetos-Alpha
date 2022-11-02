import 'package:flutter/material.dart';
import 'user_model.dart';
import 'constants.dart';
import 'api_service.dart';
import 'main.dart';
import 'infoshow.dart';



class SearchMovie extends SearchDelegate {

  ApiService _userModel = ApiService();


  @override
  List<Widget>? buildActions(BuildContext context) {
    
  }

  //late List<UserModel>? _userModel = [];
  

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<UserModel>?>(
        future: _userModel.getUsers(query),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          List<UserModel>? data = snapshot.data;
          return ListView.builder(
              itemCount: data?.length,
              itemBuilder: (context, index) {
                final Image passarimagemsearch = Image.network('${data?[index].img.medium}');
                final String passarnomesearch = '${data?[index].name}' ;
                final String diapassadosearch = '${data?[index].schedule.days}';
                final String horariopassadosearch = '${data?[index].schedule.time}';
                final String generopassadosearch = '${data?[index].genres}';
                final String resumopassadosearch = '${data?[index].summary}';
                //ApiConstants.listatemporadas = '/shows/${data?[index].id}/seasons';
                 String idseriepassadosearch = '${data?[index].id.toString()}';

               



                return ListTile(
                  title: Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.deepPurpleAccent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            '${data?[index].id}',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            overflow: TextOverflow.clip,
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network('${data?[index].img.medium}'),
                            SizedBox(height: 10),
                            Text(
                              '${data?[index].name}',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            
                            TextButton(
  style: ButtonStyle(
    foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
  ),
  onPressed: () {  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => InfoShow(nomepassado: passarnomesearch, imagempassado: passarimagemsearch, horariosrecebidos:diapassadosearch,
      horariosrecebidos2:horariopassadosearch, generosrecebidos: generopassadosearch, resumorecebido: resumopassadosearch, idserierecebida: idseriepassadosearch
      ),
  ),
  );
  },
  child: Text('Ver Informações da série'),
  
) 
                          ])
                    ],
                  ),
                );
              });
        });

    // TODO: implement buildResults
    //throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Text('Digite o nome da série'),
    );
  }

}



 
  

