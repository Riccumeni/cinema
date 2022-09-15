import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cinema_app/class/request.dart';
import 'package:cinema_app/container/film.dart';
import 'package:cinema_app/class/film.dart';

class Palinsesto extends StatelessWidget {
  const Palinsesto({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Request req = new Request();

    return Container(
        margin: const EdgeInsets.only(top: 60.0, left: 30.0, right: 30),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future:
                    req.get(url: 'http://192.168.1.225:3000/api/palinsesto'),
                builder: (context, snapshot) {
                  if (snapshot.data != null) {
                    var spettacoli = snapshot.data;
                    return ListView(
                        padding: EdgeInsets.all(60),
                        scrollDirection: Axis.horizontal,
                        children: [
                          for (var element in spettacoli!)
                            Container(
                                padding: EdgeInsets.only(right: 40),
                                child: InkWell(
                                  child: Image(
                                    image: NetworkImage(
                                        'http://192.168.1.225:3000/img/${element.locandina}'),
                                    height: 500,
                                    width: 400,
                                    fit: BoxFit.fill,
                                  ),
                                  onTap: (() {
                                    print(element.nome);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => FilmW(
                                                nomeFilm: element.nome,
                                              )),
                                    );
                                  }),
                                )),
                        ]);
                  }
                  return CircularProgressIndicator();
                },
              ),
            ),
          ],
        ));
  }
}
