class Contato {
  String? celular;
  String? email;
  String? telefoneFixo;

  Contato({this.celular, this.email, this.telefoneFixo});

  Contato.fromJson(Map<String, dynamic> json) {
    celular = json['celular'];
    email = json['email'];
    telefoneFixo = json['telefone_fixo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['celular'] = this.celular;
    data['email'] = this.email;
    data['telefone_fixo'] = this.telefoneFixo;
    return data;
  }
}
