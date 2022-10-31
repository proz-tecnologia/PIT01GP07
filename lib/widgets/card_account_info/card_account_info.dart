import 'package:flutter/material.dart';
import '../../widgets/account_info/account_info.dart';
import '../raisedButton_see_more/raisedButton_see_more.dart';

class CardAccountInfo extends StatefulWidget{
  const CardAccountInfo({super.key});

  @override
  CardAccountInfoState createState() => CardAccountInfoState();
}

class CardAccountInfoState extends State<CardAccountInfo>{

  @override
  Widget build (BuildContext context){
    return  Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          const Text("Minhas Contas",style: TextStyle (
              fontFamily:'Inter',
              fontWeight:FontWeight.w700,
              color: Color (0xFF2F595B),
              fontSize: 18)),
          const SizedBox(height:8),
          Container(
            height:224,
            width:double.infinity,
            decoration: const BoxDecoration(
              color:   Color (0XFFFFFFFF),
              borderRadius: BorderRadius.all(Radius.circular(10),
              ),
            ),
            child:Column(
              children:  [
                const SizedBox(height:8),
                accountInfo(nome:"PicPay", tipo: "Carteira Digital",saldo:1200,assetImage:'assets/images/bank_accounts/picpay.png'),
                const SizedBox(height:8),
                accountInfo(nome:"Caixa Econômica", tipo: "Conta Poupança",saldo:1300,assetImage:'assets/images/bank_accounts/caixa.png'),
                const SizedBox(height:8),
                accountInfo(nome:"Banco Inter", tipo: "Conta Corrente",saldo:1300,assetImage:'assets/images/bank_accounts/inter.png'),
                const SizedBox(height:8),
                seemorebutton(text: "Ver tudo"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}