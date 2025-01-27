import 'package:app_wktest/app/data/models/atributos_fisicos_model.dart';
import 'package:app_wktest/app/data/models/contato_model.dart';
import 'package:app_wktest/app/data/models/endereco_model.dart';
import 'package:app_wktest/app/data/models/filiacao_model.dart';

class Pessoa {
  int? id;
  String? nome;
  String? cpf;
  String? rg;
  String? dataNasc;
  Endereco? endereco;
  Contato? contato;
  Filiacao? filiacao;
  AtributosFisicos? atributosFisicos;

  Pessoa(
      {this.id,
      this.nome,
      this.cpf,
      this.rg,
      this.endereco,
      this.contato,
      this.filiacao,
      this.dataNasc,
      this.atributosFisicos});

  Pessoa.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    cpf = json['cpf'];
    rg = json['rg'];
    endereco = json['endereco'] != null
        ? Endereco.fromJson(json['endereco'])
        : null;
    contato =
        json['contato'] != null ? Contato.fromJson(json['contato']) : null;
    filiacao = json['filiacao'] != null
        ? Filiacao.fromJson(json['filiacao'])
        : null;
    dataNasc = json['data_nasc'];
    atributosFisicos = json['atributos_fisicos'] != null
        ? AtributosFisicos.fromJson(json['atributos_fisicos'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nome'] = nome;
    data['cpf'] = cpf;
    data['rg'] = rg;
    if (endereco != null) {
      data['endereco'] = endereco!.toJson();
    }
    if (contato != null) {
      data['contato'] = contato!.toJson();
    }
    if (filiacao != null) {
      data['filiacao'] = filiacao!.toJson();
    }
    data['data_nasc'] = dataNasc;
    if (atributosFisicos != null) {
      data['atributos_fisicos'] = atributosFisicos!.toJson();
    }
    return data;
  }
}