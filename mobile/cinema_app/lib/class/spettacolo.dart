class Spettacolo {
  final int? codiceSala;
  final int? codiceSpettacolo;
  final String? nomeFilm;
  final String? day;
  final String? month;
  final String? hour;
  final String? minute;
  final int? numeroPosti;
  final int? postiDisponibili;

  Spettacolo(
      {this.codiceSala,
      this.codiceSpettacolo,
      this.nomeFilm,
      this.day,
      this.hour,
      this.minute,
      this.month,
      this.numeroPosti,
      this.postiDisponibili});
}
