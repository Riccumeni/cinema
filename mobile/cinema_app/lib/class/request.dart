import 'package:http/http.dart' as http;
import 'package:cinema_app/class/film.dart';
import 'dart:convert';

class Request {
  Future<List> get({required String url}) async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<Film> spettacoli = [];
      var json = jsonDecode(response.body);

      for (var element in json) {
        spettacoli.add(Film.fromJson(element));
      }
      return spettacoli;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load');
    }
  }

  Future<List> getRicerca({required String endpoint}) async {
    final response = await http
        .get(Uri.parse('http://localhost:3000/api/film/search/${endpoint}'));

    if (response.statusCode == 200) {
      List<Film> spettacoli = [];
      var json = jsonDecode(response.body);

      for (var element in json['data']) {
        spettacoli.add(Film.fromJson(element));
      }
      return spettacoli;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load');
    }
  }

  Future<Film> getFilmSpecs({required String url}) async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      var json = jsonDecode(response.body);

      Film film = Film.fromJson(json['film']);

      if (json['spettacoli'] != null) {
        film.addSpettacoli(json['spettacoli']);
      }

      return film;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
