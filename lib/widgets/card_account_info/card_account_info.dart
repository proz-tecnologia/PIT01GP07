import 'package:flutter/material.dart';
import '../../design_system/colors.dart';

import '../../design_system/styleapp.dart';
import '../../widgets/account_info/account_info.dart';
import '../raisedButton_see_more/raisedbutton_see_more.dart';

class CardAccountInfo extends StatefulWidget {
  const CardAccountInfo({super.key});

  @override
  CardAccountInfoState createState() => CardAccountInfoState();
}

class CardAccountInfoState extends State<CardAccountInfo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Minhas Contas", style: StyleApp.titleCardStyle),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: AppColors.revertBackgroundColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                boxShadow: [StyleApp.boxShadow]),
            child: Column(
              children: [
                const SizedBox(height: 8),
                accountInfo(
                    nome: "PicPay",
                    tipo: "Carteira Digital",
                    saldo: 1200,
                    assetImage: 'assets/images/bank_accounts/picpay.png'),
                const SizedBox(height: 8),
                accountInfo(
                    nome: "Caixa Econômica",
                    tipo: "Conta Poupança",
                    saldo: 123.43,
                    assetImage: 'assets/images/bank_accounts/caixa.png'),
                const SizedBox(height: 8),
                accountInfo(
                    nome: "Banco Inter",
                    tipo: "Conta Corrente",
                    saldo: 98.4,
                    assetImage: 'assets/images/bank_accounts/inter.png'),
                const SizedBox(height: 8),
                seemorebutton(text: "Ver tudo"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
