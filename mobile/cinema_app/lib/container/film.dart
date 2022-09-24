import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cinema_app/class/film.dart';
import 'package:cinema_app/class/request.dart';

class FilmW extends StatefulWidget {
  final Film specs;

  const FilmW({super.key, required this.specs});

  @override
  State<FilmW> createState() => _FilmWState(film: specs);
}

class _FilmWState extends State<FilmW> {
  List<bool> isPressed = [false, false, false];
  Request req = new Request();

  final Film film;

  List<Widget> spettacoli = [];

  _FilmWState({required this.film});

  @override
  Widget build(BuildContext context) {
    int _selectedIndex = -1;
    return Scaffold(
      backgroundColor: Color(0xff001C38),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(200),
          child: AppBar(
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'http://localhost:3000/img/${film.locandina}'),
                      fit: BoxFit.fitWidth)),
            ),
            backgroundColor: Colors.blue,
          )),
      extendBodyBehindAppBar: false,
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(40),
        child: ListView(
          children: [
            Text(
              textAlign: TextAlign.center,
              "${film.nome}",
              style: TextStyle(color: Colors.white, fontSize: 28),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 20),
              child: Text(
                textAlign: TextAlign.left,
                "Trama",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
            Text(
              "${film.trama}",
              style: TextStyle(color: Colors.white),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 20),
              child: Text(
                textAlign: TextAlign.left,
                "Spettacoli",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
            Container(
                padding: EdgeInsets.only(left: 10),
                width: 200,
                height: 50,
                color: Color(0xff002C57),
                child: FutureBuilder(
                    future: req.getDate(nome: film.nome),
                    builder: ((context, snapshot) {
                      if (snapshot.data != null) {
                        return ListView(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            children: [
                              for (int i = 0; i < snapshot.data.length; i++)
                                InkWell(
                                  child: Container(
                                    child: Center(
                                      child: Text(
                                          "${snapshot.data[i]['day']}/${snapshot.data[i]['month']}  ",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: isPressed[i]
                                                    ? Colors.white
                                                    : Colors.transparent))),
                                  ),
                                  onTap: () => {
                                    setState(() {
                                      spettacoli.clear();
                                      int k = 0;
                                      film.spettacoli.forEach((element) {
                                        if (element.day ==
                                                snapshot.data[i]['day']
                                                    .toString() &&
                                            element.month ==
                                                snapshot.data[i]['month']
                                                    .toString()) {
                                          spettacoli.add(
                                            Container(
                                              padding: EdgeInsets.only(
                                                  top: 5,
                                                  left: 5,
                                                  right: 20,
                                                  bottom: 5),
                                              margin: EdgeInsets.only(),
                                              color: k % 2 == 0
                                                  ? Color.fromARGB(
                                                      149, 18, 74, 119)
                                                  : Colors.transparent,
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "${element.hour}:${element.minute}",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                    Text(
                                                      "${element.codiceSala}",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                    InkWell(
                                                      child: Icon(
                                                        Icons.list,
                                                        color: Colors.white,
                                                      ),
                                                      onTap: () => showDialog(
                                                          context: context,
                                                          builder: (BuildContext
                                                                  context) =>
                                                              Theme(
                                                                  data: ThemeData
                                                                      .dark(),
                                                                  child:
                                                                      CupertinoAlertDialog(
                                                                    title: Text(
                                                                        "${film.nome}"),
                                                                    content:
                                                                        Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                            "Orario: ${element.hour}:${element.minute}"),
                                                                        Text(
                                                                            "Data: ${element.day}/${element.month}"),
                                                                        Text(
                                                                            "Sala: ${element.codiceSala}"),
                                                                        Text(
                                                                            "Posti Disponibili: ${element.postiDisponibili}")
                                                                      ],
                                                                    ),
                                                                    actions: [
                                                                      CupertinoDialogAction(
                                                                        child: Text(
                                                                            "Prenota"),
                                                                      )
                                                                    ],
                                                                  ))),
                                                    )
                                                  ]),
                                            ),
                                          );
                                          k++;
                                        }
                                      });
                                      for (int j = 0;
                                          j < isPressed.length;
                                          j++) {
                                        isPressed[j] = false;
                                      }
                                      isPressed[i] = !isPressed[i];
                                      print(spettacoli.length);
                                    })
                                  },
                                ),
                            ]);
                      }
                      return Text("suu");
                    }))),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10, top: 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Orario",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          Text(
                            "Sala",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          Text(
                            "Dettagli",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ]),
                  ),
                  for (var element in spettacoli) element,
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
        backgroundColor: Color(0xff002C57),
      ),
    );
  }
}
