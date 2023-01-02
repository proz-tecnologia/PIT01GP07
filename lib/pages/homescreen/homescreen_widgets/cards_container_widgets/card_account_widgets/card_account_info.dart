import 'package:flutter/material.dart';
import '../../../../my_accounts.dart';
import 'account_info.dart';
import '../../../../../widgets/raisedbutton_see_more.dart';
import '../../../../../design_system/styleapp.dart';

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
          Text(
            "Minhas Contas",
            style: Theme.of(context).textTheme.headline2,
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: const BorderRadius.all(
                StyleApp.borderRadius,
              ),
              boxShadow: [
                StyleApp.boxShadow,
              ],
            ),
            child: Column(
              children: [
                const SizedBox(height: 8),
                const AccountInfo(
                    nome: "PicPay",
                    tipo: "Carteira Digital",
                    saldo: 1200,
                    assetImage: 'assets/images/bank_accounts/picpay.png'),
                const SizedBox(height: 8),
                const AccountInfo(
                    nome: "Caixa Econômica",
                    tipo: "Conta Poupança",
                    saldo: 123.43,
                    assetImage: 'assets/images/bank_accounts/caixa.png'),
                const SizedBox(height: 8),
                const AccountInfo(
                    nome: "Banco Inter",
                    tipo: "Conta Corrente",
                    saldo: 98.4,
                    assetImage: 'assets/images/bank_accounts/inter.png'),
                const SizedBox(height: 8),
                SeeMoreButton(
                  text: "Ver tudo",
                  page: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyAccounts()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
