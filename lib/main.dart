import 'package:flutter/material.dart';
import 'package:listaseries/infoshow.dart';
import 'package:listaseries/seasonepisodemodel.dart';
import 'package:listaseries/seasonmodel.dart';
import 'user_model.dart';
import 'constants.dart';
import 'api_service.dart';
import 'search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lista de Séries',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Lista Séries'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<UserModel>? _userModel = [];
  //late List<SeasonModel>? _seasonmodel = [];
  late List<SeasonEpisodeModel>? _seasonepisodemodel = [];

  @override
  void initState() {
    super.initState();
    _getData();
    // _getSeason();
  }

  void _getData() async {
    _userModel = (await ApiService().getUsers(SearchMovie().query))!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  /* void _getSeason() async{
    _seasonmodel = (await ApiService().getSeasons());
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }
*/

  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text('Busca uma série específica?');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: customSearchBar,
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: SearchMovie());
            },
            icon: customIcon,
          )
        ],
        centerTitle: true,
      ),
      body: _userModel == null || _userModel!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _userModel!.length,
              itemBuilder: (context, index) {
                final Image passarimagem =
                    Image.network(_userModel![index].img.medium);
                final String passarnome = _userModel![index].name;
                final String horariospassados =
                    _userModel![index].schedule.days.toString();
                final String horariospassados2 =
                    _userModel![index].schedule.time.toString();
                final String generospassados =
                    _userModel![index].genres.toString();
                final String resumospassados = _userModel![index].summary;
                String getidseriepassado = _userModel![index].id.toString();

                return Card(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.network(_userModel![index].img.medium),
                          Text(_userModel![index].id.toString()),
                          Text(_userModel![index].name),
                          TextButton(
                            style: ButtonStyle(
                              overlayColor:
                                  MaterialStateProperty.resolveWith<Color?>(
                                      (Set<MaterialState> states) {
                                if (states.contains(MaterialState.focused))
                                  return Colors.red;
                                return null; // Defer to the widget's default.
                              }),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => InfoShow(
                                    nomepassado: passarnome,
                                    imagempassado: passarimagem,
                                    horariosrecebidos: horariospassados,
                                    horariosrecebidos2: horariospassados2,
                                    generosrecebidos: generospassados,
                                    resumorecebido: resumospassados,
                                    idserierecebida: getidseriepassado,
                                  ),
                                ),
                              );
                            },
                            child: Text('Ver Informações da Série'),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                );
              },
            ),
    );
    // This trailing comma makes auto-formatting nicer for build methods.
  }
}
