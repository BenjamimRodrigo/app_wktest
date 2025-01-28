class ResponseIdadePorTipoSanguineoDTO {
  double idadeMedia = 0.00;
  String tipoSanguineo = "";
  String sigla = "";
  ResponseIdadePorTipoSanguineoDTO({required this.idadeMedia, required this.tipoSanguineo, required this.sigla});

  factory ResponseIdadePorTipoSanguineoDTO.fromJson(Map<String, dynamic> json) {
    return ResponseIdadePorTipoSanguineoDTO(
      idadeMedia: json['idade_media'],
      tipoSanguineo: json['tipo_sanguineo'],
      sigla: json['sigla'],
    );
  }
}
