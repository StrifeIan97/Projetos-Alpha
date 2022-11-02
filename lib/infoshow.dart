import 'package:flutter/material.dart';
import 'package:listaseries/EpisodiosTemporada.dart';
import 'package:listaseries/constants.dart';
import 'package:listaseries/seasonmodel.dart';
import 'api_service.dart';
import 'user_model.dart';
import 'episode_model.dart';

class InfoShow extends StatelessWidget {
  ApiService eplist = ApiService();

  final String nomepassado;
  final Image imagempassado;
  final String horariosrecebidos;
  final String generosrecebidos;
  final String resumorecebido;
  final String horariosrecebidos2;
   String idserierecebida;
  

  InfoShow(
      {Key? key,
      required this.nomepassado,
      required this.imagempassado,
      required this.horariosrecebidos,
      required this.generosrecebidos,
      required this.resumorecebido,
      required this.horariosrecebidos2,
      required this.idserierecebida
     })
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nomepassado),
      ),
      
      
      body: SingleChildScrollView(child: 
      
       Column(
        
        mainAxisSize: MainAxisSize.min,
        children: [
          imagempassado,
          Text("Nome da série: $nomepassado"),
          Text("Dia: $horariosrecebidos"),
          Text("Horário: $horariosrecebidos2"),
          Text("Gênero: $generosrecebidos"),
          Text("Resumo :\n $resumorecebido"),
          Text(idserierecebida.toString()),
         
          
           FutureBuilder<List<SeasonModel>?>(
          
        future: eplist.getSeasons(idserierecebida),

        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
           List<SeasonModel>? data =  snapshot.data;
          
          return ListView.builder(
             shrinkWrap: true,
             //scrollDirection: Axis.vertical,
              itemCount: data?.length,
              itemBuilder: (context, index) {

              String numerotemporadapassado = '${data?[index].number}';

              
               
                return ListTile(

                  title: Column(
                    children: [
                      
                      SizedBox(width: 20),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(eplist.getSeasons(idserierecebida).toString()),
                            Image.network('${data?[index].image.medium}'),
                            SizedBox(height: 10),
                             Text(
                              'Temporada: ${data?[index].number}',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
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
  onPressed: () { Navigator.of(context).push(MaterialPageRoute(builder: (context)=>EpisodiosPorTemporada(valortemprecebido: numerotemporadapassado,))) ;
  },
  child: Text('Ver Episódios da temporada'),
  
)
                          ])
                    ],
                  ),
                );
              });
        }
           )
  

        ],
      ),
    ));
  }
}
