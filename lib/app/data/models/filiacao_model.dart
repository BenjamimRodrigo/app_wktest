class Filiacao {
  String? nomePai;
  String? nomeMae;

  Filiacao({this.nomePai, this.nomeMae});

  Filiacao.fromJson(Map<String, dynamic> json) {
    nomePai = json['nome_pai'];
    nomeMae = json['nome_mae'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nome_pai'] = nomePai;
    data['nome_mae'] = nomeMae;
    return data;
  }
}