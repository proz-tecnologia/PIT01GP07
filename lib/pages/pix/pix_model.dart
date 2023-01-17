class PixModel {
  String? tipo;
  String? codigo;
  String? conta;
  String? descricao;

  PixModel({
    this.tipo,
    this.codigo,
    this.conta,
    this.descricao,
  });

  PixModel.fromJson(Map<String, dynamic> json) {
    tipo = json['tipo'];
    codigo = json['codigo'];
    conta = json['conta'];
    descricao = json['descricao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tipo'] = tipo;
    data['codigo'] = codigo;
    data['conta'] = conta;
    data['descricao'] = descricao;

    return data;
  }


}
