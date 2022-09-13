import 'package:http/http.dart' as http;
import 'package:cinema_app/spettacolo.dart';
import 'dart:convert';

class Request {
  Future<List> get({required String url}) async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<Spettacolo> spettacoli = [];
      var json = jsonDecode(response.body);

      for (var element in json) {
        spettacoli.add(Spettacolo.fromJson(element));
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
      List<Spettacolo> spettacoli = [];
      var json = jsonDecode(response.body);

      for (var element in json['data']) {
        spettacoli.add(Spettacolo.fromJson(element));
      }
      return spettacoli;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load');
    }
  }
}
