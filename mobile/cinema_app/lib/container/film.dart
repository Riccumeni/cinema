import 'package:flutter/material.dart';
import 'package:cinema_app/class/film.dart';

class FilmW extends StatefulWidget {
  const FilmW({super.key, nomeFilm});

  @override
  State<FilmW> createState() => _FilmWState();
}

class _FilmWState extends State<FilmW> {
  List<bool> isPressed = [false, false, false];
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
                          'https://mr.comingsoon.it/imgdb/locandine/big/50817.jpg'),
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
              "Uncharted",
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
              "I fratelli Nathan e Sam Drake vengono catturati dalla sicurezza per aver cercato di rubare la prima mappa realizzata dopo la spedizione di Magellano. Poiché questo è il terzo reato di Sam, l'orfanotrofio che ospita entrambi i ragazzi butta fuori Sam e lo costringe a stare altrove, lontano da Nate. Prima di andarsene, Sam promette al fratellino che tornerà a prenderlo, lasciandogli un anello appartenente al loro antenato sir Francis Drake, con la scritta Sic Parvis Magna (Da umili origini a grandi imprese).",
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
                child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: [
                      for (int i = 0; i < 3; i++)
                        InkWell(
                          child: Container(
                            child: Center(
                              child: Text("${i + 27}/01  ",
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
                              for (int j = 0; j < isPressed.length; j++) {
                                isPressed[j] = false;
                              }
                              isPressed[i] = !isPressed[i];
                            })
                          },
                        ),
                    ])),
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
                  for (int i = 0; i < 5; i++)
                    Container(
                      padding: EdgeInsets.only(
                          top: 5, left: 5, right: 20, bottom: 5),
                      margin: EdgeInsets.only(),
                      color: i % 2 == 0
                          ? Color.fromARGB(149, 18, 74, 119)
                          : Colors.transparent,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "16:50",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "2",
                              style: TextStyle(color: Colors.white),
                            ),
                            Icon(
                              Icons.list,
                              color: Colors.white,
                            )
                          ]),
                    ),
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
