class ResponsePessoasPorUFDTO {
  String estado = "";
  String bandeira = "";
  int total = 0;
  ResponsePessoasPorUFDTO({required this.estado, required this.total, required this.bandeira});

  factory ResponsePessoasPorUFDTO.fromJson(Map<String, dynamic> json) {
    return ResponsePessoasPorUFDTO(
      estado: json['estado'],
      total: json['total'],
      bandeira: "assets/images/bandeiras_estados/${json['estado'].toString().toUpperCase()}.png",
    );
  }
}
