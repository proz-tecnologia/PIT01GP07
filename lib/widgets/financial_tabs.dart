import 'package:flutter/material.dart';
import '../chart_widget.dart';

Widget minhasRendas() {
  return Charts(chartData: renda,);
}
Widget minhasDespesas() {
  return Charts(chartData: despesas,);

}

List<ChartData> renda= [
ChartData('Salário', 85, const Color.fromRGBO(9,0,136,1)),
ChartData('Rendimentos', 10, const Color.fromRGBO(147,0,119,1)),
ChartData('Outros', 5, const Color.fromRGBO(255,189,57,1))
];

List<ChartData> despesas= [
  ChartData('Aluguel', 30, const Color.fromRGBO(9,0,136,1)),
  ChartData('Alimentação', 30, const Color.fromRGBO(147,0,119,1)),
  ChartData('Transporte', 25, const Color.fromRGBO(228,0,124,1)),
  ChartData('Água e Luz', 15, const Color.fromRGBO(255,189,57,1))
];