class AtributosFisicos {
  double? altura;
  double? peso;
  String? sexo;
  String? tipoSanguineo;

  AtributosFisicos({this.altura, this.peso, this.sexo, this.tipoSanguineo});

  AtributosFisicos.fromJson(Map<String, dynamic> json) {
    altura = json['altura'];
    peso = json['peso'];
    sexo = json['sexo'];
    tipoSanguineo = json['tipo_sanguineo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['altura'] = altura;
    data['peso'] = peso;
    data['sexo'] = sexo;
    data['tipo_sanguineo'] = tipoSanguineo;
    return data;
  }
}
