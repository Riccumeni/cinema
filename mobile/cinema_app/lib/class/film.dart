import 'package:cinema_app/class/spettacolo.dart';
import 'package:cinema_app/class/request.dart';

class Film {
  final String? nome;
  final String? genere;
  final String? trama;
  final String? locandina;
  final String? trailer;
  List? date;
  var spettacoli = [];

  Request req = new Request();

  Film({this.locandina, this.nome, this.trama, this.genere, this.trailer});

  factory Film.fromJson(Map<String, dynamic> json) {
    return Film(
        locandina: json['locandina'],
        nome: json['nome'],
        genere: json['genere'],
        trama: json['trama'],
        trailer: json['trailer']);
  }

  void addSpettacoli(List<dynamic> json) {
    for (var value in json) {
      spettacoli.add(Spettacolo(
          codiceSala: value['codicesala'],
          codiceSpettacolo: value['codice'],
          nomeFilm: value['nomefilm'],
          month: value['month'].toString(),
          day: value['day'].toString(),
          hour: value['hour'].toString(),
          minute: value['minute'].toString(),
          numeroPosti: value['numeroposti'],
          postiDisponibili: value['postidisponibili']));
    }
  }
}
