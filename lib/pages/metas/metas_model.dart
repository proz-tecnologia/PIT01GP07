class MetasModel {
  DateTime? conclusao;
  String? titulo;
  String? valor;
  bool? realizado;

  MetasModel(this.conclusao, this.titulo, this.valor, this.realizado);

  MetasModel.fromJson(Map<String, dynamic> json) {
    conclusao = json['data_conclusao'];
    titulo = json['titulo'];
    valor = json['valor'];
    realizado = json['realizado'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['data_conclusao'] = conclusao;
    data['titulo'] = titulo;
    data['valor'] = valor;
    data['realizado'] = realizado;

    return data;
  }
}
