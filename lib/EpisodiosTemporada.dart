import 'package:flutter/material.dart';
import 'package:listaseries/infoEp.dart';
import 'package:listaseries/seasonepisodemodel.dart';
import 'package:listaseries/seasonmodel.dart';
import 'api_service.dart';
import 'constants.dart';
import 'user_model.dart';
import 'episode_model.dart';

class EpisodiosPorTemporada extends StatelessWidget {
  ApiService eplist = ApiService();

  String valortemprecebido;
  String idserierecebido2;

  EpisodiosPorTemporada({
    Key? key,
    required this.valortemprecebido,
    required this.idserierecebido2,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Lista de Episódios"),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FutureBuilder<List<Episodios>?>(
                  future: eplist.getSeasonsEpisodes(valortemprecebido,idserierecebido2),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    List<Episodios>? data = snapshot.data;

                    return ListView.builder(
                        shrinkWrap: true,
                        //scrollDirection: Axis.vertical,
                        itemCount: data?.length,
                        itemBuilder: (context, index) {
                          final Image imagemeppassado =
                              Image.network('${data?[index].image.medium}');
                          final String numeroeppassado =
                              '${data?[index].number}';
                          final String nomeeppassado = '${data?[index].name}';
                          final String temporadaeppassado =
                              '${data?[index].season}';
                          final String resumoeppassado =
                              '${data?[index].summary}';
                          //ApiConstants.listatemporadasepisodios = '/seasons/${data?[index].season}/episodes';

                          return ListTile(
                            title: Column(
                              children: [
                                SizedBox(width: 20),
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.network(
                                          '${data?[index].image.medium}'),
                                      SizedBox(height: 10),
                                      Text(
                                        '${data?[index].number}',
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
                                          foregroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.blue),
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      InfoEpisodios(
                                                        imageeprecebido:
                                                            imagemeppassado,
                                                        numeroeprecebido:
                                                            numeroeppassado,
                                                        nomeeprecebido:
                                                            nomeeppassado,
                                                        temporadaeprecebido:
                                                            temporadaeppassado,
                                                        resumoeprecebido:
                                                            resumoeppassado,
                                                      )));
                                        },
                                        child:
                                            Text('Ver Informações do Episódio'),
                                      )
                                    ])
                              ],
                            ),
                          );
                        });
                  })
            ],
          ),
        ));
  }
}
