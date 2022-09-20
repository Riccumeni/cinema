import 'package:flutter/material.dart';
import 'package:cinema_app/class/request.dart';

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
    return Container(
      margin: const EdgeInsets.only(top: 60.0, left: 30.0, right: 30),
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.only(top: 30),
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
                                    margin:
                                        EdgeInsets.only(left: 20, right: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          element.nome,
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          "27/01 - 28/01 ...",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          onTap: () {
                            print("suu");
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
    );
  }
}
