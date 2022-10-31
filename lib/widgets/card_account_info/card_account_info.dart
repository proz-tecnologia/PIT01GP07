import 'package:flutter/material.dart';
import 'package:teste/design_system/colors.dart';
import 'package:teste/design_system/styleapp.dart';
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
          const Text("Minhas Contas",
              style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  color: AppColors.secondtextColor,
                  fontSize: 18)),
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
                    saldo: 1300,
                    assetImage: 'assets/images/bank_accounts/caixa.png'),
                const SizedBox(height: 8),
                accountInfo(
                    nome: "Banco Inter",
                    tipo: "Conta Corrente",
                    saldo: 1300,
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
