import 'package:flutter/material.dart';
import 'package:flutter_json_serializable/src/models/people_model.dart';
import 'package:go_router/go_router.dart';

class HomePageJsonSerializable extends StatelessWidget {
  
  HomePageJsonSerializable({super.key});

  final List<People> people = [
    People(id:'1234512345', names: 'John Wick', age: '29', profilePicture: 'https://media.istockphoto.com/id/1424988699/es/foto/hombre-de-negocios-contemplando-en-la-oficina-mirando-por-la-ventana.jpg?s=612x612&w=is&k=20&c=AiRkJeUtlEy_aCG6vn9Pk45Zpp5Tz_agI5bk14A2z1s='),
    People(id:'678945641', names: 'Alex Buffet', age: '25', profilePicture: 'https://media.istockphoto.com/id/1475303340/es/foto/retrato-de-un-hombre-de-negocios-adulto-medio-sosteniendo-una-computadora-port%C3%A1til-en-el.jpg?s=612x612&w=is&k=20&c=Kw_tWaKoAAYTmSkdy92Qx3Y8I0RUU51VsF-he_ve2kg='),
    People(id:'4545454545', names: 'Laura Torrent', age: '23', profilePicture: 'https://media.istockphoto.com/id/1483869287/es/foto/feliz-empresaria-trabajando-en-la-oficina-y-sosteniendo-una-tableta.jpg?s=612x612&w=is&k=20&c=ej4izOlHNc_Qce9_8AG0XQsaWNpIYHvvlD1tdiplClc='),
    People(id:'159753121', names: 'Andrea Winchester', age: '30', profilePicture: 'https://media.istockphoto.com/id/1475804411/es/foto/sonriente-joven-hispana-trabajadora-aut%C3%B3noma-de-pie-en-el-estudio-con-una-computadora-port%C3%A1til.jpg?s=2048x2048&w=is&k=20&c=_lQzcFlLAHidHfoxbmDuPJ1HTJ9gwdExRWMJTyr3c4g='),
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF83E286),
          leading: IconButton(
            onPressed: () => context.go('/'),
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 30,
              color: Colors.white,
            ),
          ),
          title: const Text(
            'People List',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: ListView.builder(
          itemCount: people.length,
          itemBuilder: (context, index) {
            if (index < people.length) {
              return Card(
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: 80,
                          backgroundImage: NetworkImage(
                            people[index].profilePicture,
                          ),
                        ), 
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ListTile(
                              title: const Text('ID:'),
                              subtitle: Text(people[index].id),
                            ),
                            ListTile(
                              title: const Text('Names:'),
                              subtitle: Text(people[index].names),
                            ),
                            ListTile(
                              title: const Text('Age:'),
                              subtitle: Text(people[index].age),
                            ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
