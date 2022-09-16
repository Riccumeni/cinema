import 'package:flutter/material.dart';
import 'package:cinema_app/class/film.dart';

class FilmW extends StatelessWidget {
  final nomeFilm;
  const FilmW({super.key, this.nomeFilm});

  @override
  Widget build(BuildContext context) {
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
              "skdfmodsffmeofmweokwekofmewokmweok, womioemcoiwmoiwecmoiew. ewoifniownfoivnewo",
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
              padding: EdgeInsets.all(10),
              width: 200,
              height: 50,
              color: Color(0xff002C57),
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: [
                    Center(
                      child: Text("27/01  ",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                    Center(
                      child: Text("28/01",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  ]),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () {},
        backgroundColor: Color(0xff002C57),
      ),
    );
  }
}
