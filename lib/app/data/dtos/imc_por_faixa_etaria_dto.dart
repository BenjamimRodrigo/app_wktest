class ResponseIMCPorFaixaEtariaDTO {
  int faixaEtaria = 0;
  double imcMedio = 0.00;
  ResponseIMCPorFaixaEtariaDTO({required this.faixaEtaria, required this.imcMedio});

  factory ResponseIMCPorFaixaEtariaDTO.fromJson(Map<String, dynamic> json) {
    return ResponseIMCPorFaixaEtariaDTO(
      faixaEtaria: json['faixa_etaria'],
      imcMedio: json['imc_medio'],
    );
  }
}
