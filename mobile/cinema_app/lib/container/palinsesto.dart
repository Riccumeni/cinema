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

    ScrollController sc = new ScrollController();

    sc.addListener(
      () {
        print(sc.offset);
      },
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
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
          margin: const EdgeInsets.only(top: 120.0, left: 30.0, right: 30),
          child: Column(
            children: [
              Expanded(
                child: FutureBuilder(
                  future: req.get(url: 'http://localhost:3000/api/palinsesto'),
                  builder: (context, snapshot) {
                    if (snapshot.data != null) {
                      var spettacoli = snapshot.data;
                      return ListView(
                          controller: sc,
                          padding: EdgeInsets.all(60),
                          scrollDirection: Axis.horizontal,
                          children: [
                            for (var element in spettacoli!)
                              Container(
                                  width: 350,
                                  margin: EdgeInsets.only(right: 40),
                                  decoration: BoxDecoration(boxShadow: [
                                    BoxShadow(
                                        color: Colors.blue.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(0, 3)),
                                  ]),
                                  child: InkWell(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image(
                                        image: NetworkImage(
                                            'http://localhost:3000/img/${element.locandina}'),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    onTap: (() async {
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
                                    }),
                                  )),
                          ]);
                    }
                    return CircularProgressIndicator();
                  },
                ),
              ),
            ],
          )),
    );
  }
}
