class MetasModel {
  DateTime? conclusao;
  String? titulo;
  String? valor;
  bool? realizado;

  MetasModel({this.conclusao, this.titulo, this.valor, this.realizado = false});

  MetasModel.fromJson(Map<String, dynamic> json) {
    conclusao = json['conclusao'].toDate();
    titulo = json['titulo'];
    valor = json['valor'];
    realizado = json['realizado'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['conclusao'] = conclusao;
    data['titulo'] = titulo;
    data['valor'] = valor!.replaceAll(',', '.');
    data['realizado'] = realizado;

    return data;
  }
}
