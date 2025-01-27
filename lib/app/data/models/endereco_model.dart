class Endereco {
  String? cep;
  String? logradouro;
  String? numero;
  String? bairro;
  String? cidade;
  String? estado;

  Endereco(
      {this.cep,
      this.logradouro,
      this.numero,
      this.bairro,
      this.cidade,
      this.estado});

  Endereco.fromJson(Map<String, dynamic> json) {
    cep = json['cep'];
    logradouro = json['logradouro'];
    numero = json['numero'];
    bairro = json['bairro'];
    cidade = json['cidade'];
    estado = json['estado'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cep'] = this.cep;
    data['logradouro'] = this.logradouro;
    data['numero'] = this.numero;
    data['bairro'] = this.bairro;
    data['cidade'] = this.cidade;
    data['estado'] = this.estado;
    return data;
  }
}