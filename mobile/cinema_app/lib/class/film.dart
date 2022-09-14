import 'package:cinema_app/class/spettacolo.dart';

class Film {
  final String? nome;
  final String? genere;
  final String? trama;
  final String? locandina;
  final String? trailer;
  var spettacoli = [];

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
          inizioFilm: value['iniziofilm'],
          fineFilm: value['finefilm'],
          numeroPosti: value['numeroposti'],
          postiDisponibili: value['postidisponibili']));
    }
  }
}
