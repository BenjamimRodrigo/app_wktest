class ResponseObesidadePorGeneroDTO {
  String genero = "";
  double percentual = 0.00;
  ResponseObesidadePorGeneroDTO({required this.genero, required this.percentual});

  factory ResponseObesidadePorGeneroDTO.fromJson(Map<String, dynamic> json) {
    return ResponseObesidadePorGeneroDTO(
      genero: json['genero'],
      percentual: json['percentual'],
    );
  }
}
