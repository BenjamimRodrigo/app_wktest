class ResponseQtdPorTipoSanguineoDTO {
  int totalDoadores = 0;
  String tipoSanguineo = "";
  String sigla = "";
  ResponseQtdPorTipoSanguineoDTO({required this.totalDoadores, required this.tipoSanguineo, required this.sigla});

  factory ResponseQtdPorTipoSanguineoDTO.fromJson(Map<String, dynamic> json) {
    return ResponseQtdPorTipoSanguineoDTO(
      totalDoadores: json['total_doadores'],
      tipoSanguineo: json['tipo_sanguineo'],
      sigla: json['sigla'],
    );
  }
}
