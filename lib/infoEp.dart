import 'package:flutter/material.dart';

class InfoEpisodios extends StatelessWidget{
  final Image imageeprecebido;
  final String nomeeprecebido;
  final String numeroeprecebido;
  final String temporadaeprecebido;
  final String resumoeprecebido;
    InfoEpisodios({Key? key,
    required this.imageeprecebido,
    required this.nomeeprecebido,
    required this.numeroeprecebido,
    required this.temporadaeprecebido,
    required this.resumoeprecebido}):super(key: key);
  @override
  Widget build(BuildContext context) {

    return Scaffold(appBar:AppBar(title: Text(nomeeprecebido),),

    body: Column(mainAxisSize: MainAxisSize.max,
         children: [

          imageeprecebido,
          Text("Número do episódio: $numeroeprecebido"),
          Text("Nome do episódio: $nomeeprecebido"),
          Text("Número da temporada: $temporadaeprecebido"),
          Text("Resumo do episódio: \n $resumoeprecebido")

         ],
    ),
    );

  }

  
}