import 'package:flutter/material.dart';
import 'package:cinema_app/class/request.dart';
import 'package:cinema_app/container/film.dart';

class Ricerca extends StatefulWidget {
  const Ricerca({super.key});

  @override
  State<Ricerca> createState() => _RicercaState();
}

class _RicercaState extends State<Ricerca> {
  List<Widget> _spettacoli = [];
  int _number = 5;
  Request req = new Request();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              "Palinsesto",
              style: const TextStyle(
                  fontSize: 24, color: Colors.white, letterSpacing: 2),
            ),
            const SizedBox(width: 10),
            Icon(
              Icons.schedule,
              color: Colors.white,
            )
          ],
        ),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(
            thickness: 1,
            height: 0,
            color: Color.fromARGB(88, 158, 158, 158),
          ),
        ),
      ),
      backgroundColor: Color(0xff001C38),
      body: Container(
        margin: const EdgeInsets.only(top: 30.0, left: 30.0, right: 30),
        child: Column(
          children: [
            Container(
                child: SizedBox(
              width: 350,
              child: TextField(
                style: TextStyle(color: Colors.white),
                onSubmitted: (String value) async {
                  List temp = await req.getRicerca(endpoint: value);

                  List<Widget> temp2 = [];
                  for (var element in temp) {
                    temp2.add(
                      InkWell(
                        child: Card(
                          color: Color(0xff002C57),
                          child: Row(
                            children: [
                              Image(
                                image: NetworkImage(
                                    'http://localhost:3000/img/${element.locandina}'),
                                height: 80,
                                width: 80,
                                fit: BoxFit.cover,
                              ),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(left: 20, right: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        element.nome,
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.white),
                                      ),
                                      Text(
                                        "placeholder date",
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        onTap: () async {
                          final response = await req.getFilmSpecs(
                              url:
                                  'http://localhost:3000/api/film/${element.nome}');

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FilmW(
                                      specs: response,
                                    )),
                          );
                        },
                      ),
                    );
                  }

                  setState(() {
                    _spettacoli.clear();
                    _spettacoli.addAll(temp2);
                  });
                },
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color(0xff002C57),
                  hintText: "Inserisci il nome del film...",
                  hintStyle: TextStyle(color: Colors.white60),
                  labelText: "Nome film",
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.done,
              ),
            )),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 20),
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    for (var element in _spettacoli) element,
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
