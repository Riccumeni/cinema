class Spettacolo {
  final String locandina;
  final String nomefilm;

  const Spettacolo({
    required this.locandina,
    required this.nomefilm,
  });

  factory Spettacolo.fromJson(Map<String, dynamic> json) {
    final nome;

    print('json: ${json['nome']}');

    if (json['nomefilm'] == null) {
      nome = json['nome'];
    } else {
      nome = json['nomefilm'];
    }
    return Spettacolo(
      locandina: json['locandina'],
      nomefilm: nome,
    );
  }
}
