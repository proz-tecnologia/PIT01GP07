import 'package:flutter/material.dart';

class EditDialogBox extends StatefulWidget {
  final String text;

  const EditDialogBox(
      {Key? key,
        required this.text,
        })
      : super(key: key);

  @override
  EditDialogBoxState createState() => EditDialogBoxState();
}

class EditDialogBoxState extends State<EditDialogBox> {
  List<Map> bankAccounts = [
    {
      'id': 0,
      'image': 'assets/images/bank_accounts/amazonia.png',
      'name': 'Amazonia',
    },
    {
      'id': 1,
      'image': 'assets/images/bank_accounts/ame.png',
      'name': 'Ame Digital',
    },
    {
      'id': 2,
      'image': 'assets/images/bank_accounts/american_express.png',
      'name': 'American Express',
    },
    {
      'id': 3,
      'image': 'assets/images/bank_accounts/americanas.png',
      'name': 'Americanas',
    },
    {
      'id': 4,
      'image': 'assets/images/bank_accounts/banco_cacique.png',
      'name': 'Banco Cacique',
    },
    {
      'id': 5,
      'image': 'assets/images/bank_accounts/banco_inter.png',
      'name': 'Banco Inter',
    },
    {
      'id': 6,
      'image': 'assets/images/bank_accounts/banco_do_brasil.png',
      'name': 'Banco do Brasil',
    },
    {
      'id': 7,
      'image': 'assets/images/bank_accounts/banco_nordeste.png',
      'name': 'Banco do Nordeste',
    },
    {
      'id': 8,
      'image': 'assets/images/bank_accounts/banco_pan.png',
      'name': 'Banco Pan',
    },
    {
      'id': 9,
      'image': 'assets/images/bank_accounts/banco_votorantim.png',
      'name': 'Banco Votorantim',
    },
    {
      'id': 10,
      'image': 'assets/images/bank_accounts/ben_visa_vale.png',
      'name': 'Ben Visa Vale',
    },
    {
      'id': 11,
      'image': 'assets/images/bank_accounts/wallet.png',
      'name': 'Outros',
    },
    {
      'id': 12,
      'image': 'assets/images/bank_accounts/bmg.png',
      'name': 'BMG',
    },
    {
      'id': 13,
      'image': 'assets/images/bank_accounts/bradesco.png',
      'name': 'Bradesco',
    },
    {
      'id': 14,
      'image': 'assets/images/bank_accounts/brb.png',
      'name': 'BRB',
    },
    {
      'id': 15,
      'image': 'assets/images/bank_accounts/brde.png',
      'name': 'BRDE',
    },
    {
      'id': 16,
      'image': 'assets/images/bank_accounts/bs2.png',
      'name': 'Banco BS2',
    },
    {
      'id': 17,
      'image': 'assets/images/bank_accounts/btg.png',
      'name': 'BTG Pactual',
    },
    {
      'id': 18,
      'image': 'assets/images/bank_accounts/banco_sul.png',
      'name': 'Banco Cruzeiro do Sul',
    },
    {
      'id': 19,
      'image': 'assets/images/bank_accounts/c6.png',
      'name': 'C6 Bank',
    },
    {
      'id': 20,
      'image': 'assets/images/bank_accounts/caixa.png',
      'name': 'Caixa',
    },
    {
      'id': 21,
      'image': 'assets/images/bank_accounts/caixa_geral.png',
      'name': 'Caixa Geral',
    },
    {
      'id': 22,
      'image': 'assets/images/bank_accounts/caixabank.png',
      'name': 'CaixaBank',
    },
    {
      'id': 23,
      'image': 'assets/images/bank_accounts/caju.png',
      'name': 'Caju',
    },
    {
      'id': 24,
      'image': 'assets/images/bank_accounts/capital_one.png',
      'name': 'Capital One',
    },
    {
      'id': 25,
      'image': 'assets/images/bank_accounts/citibank.png',
      'name': 'Citibank',
    },
    {
      'id': 26,
      'image': 'assets/images/bank_accounts/cora.png',
      'name': 'Cora',
    },
    {
      'id': 27,
      'image': 'assets/images/bank_accounts/credicard.png',
      'name': 'Credicard',
    },
    {
      'id': 28,
      'image': 'assets/images/bank_accounts/digi+.png',
      'name': 'Digi+',
    },
    {
      'id': 29,
      'image': 'assets/images/bank_accounts/digio.png',
      'name': 'Digio',
    },
    {
      'id': 30,
      'image': 'assets/images/bank_accounts/diin.png',
      'name': 'Diin',
    },
    {
      'id': 31,
      'image': 'assets/images/bank_accounts/easyinvest.png',
      'name': 'Easynvest',
    },
    {
      'id': 32,
      'image': 'assets/images/bank_accounts/elo.png',
      'name': 'Elo',
    },
    {
      'id': 33,
      'image': 'assets/images/bank_accounts/flash.png',
      'name': 'Flash',
    },
    {
      'id': 34,
      'image': 'assets/images/bank_accounts/fortbrasil.png',
      'name': 'Fortbrasil',
    },
    {
      'id': 35,
      'image': 'assets/images/bank_accounts/genial_invest.png',
      'name': 'Genial Invetimentos',
    },
    {
      'id': 36,
      'image': 'assets/images/bank_accounts/hsbc.png',
      'name': 'HSBC',
    },
    {
      'id': 37,
      'image': 'assets/images/bank_accounts/hipercard.png',
      'name': 'Hipercard',
    },
    {
      'id': 38,
      'image': 'assets/images/bank_accounts/hipotecario.png',
      'name': 'Hipotecário',
    },
    {
      'id': 39,
      'image': 'assets/images/bank_accounts/iq_option.png',
      'name': 'Iti',
    },
    {
      'id': 40,
      'image': 'assets/images/bank_accounts/inbursa.png',
      'name': 'Inbursa',
    },
    {
      'id': 41,
      'image': 'assets/images/bank_accounts/isbank.png',
      'name': 'Isbank',
    },
    {
      'id': 42,
      'image': 'assets/images/bank_accounts/itau.png',
      'name': 'Itaú',
    },
    {
      'id': 43,
      'image': 'assets/images/bank_accounts/iti.png',
      'name': 'Iti',
    },
    {
      'id': 44,
      'image': 'assets/images/bank_accounts/mastercard.png',
      'name': 'Mastercard',
    },
    {
      'id': 45,
      'image': 'assets/images/bank_accounts/meracado_pago.png',
      'name': 'Mercado Pago',
    },
    {
      'id': 46,
      'image': 'assets/images/bank_accounts/n26.png',
      'name': 'N26',
    },
    {
      'id': 47,
      'image': 'assets/images/bank_accounts/neon.png',
      'name': 'Neon',
    },
    {
      'id': 48,
      'image': 'assets/images/bank_accounts/next.png',
      'name': 'Next',
    },
    {
      'id': 49,
      'image': 'assets/images/bank_accounts/nova_futura.png',
      'name': 'Nova Futura',
    },
    {
      'id': 50,
      'image': 'assets/images/bank_accounts/novo_banco.png',
      'name': 'Novo Banco',
    },
    {
      'id': 51,
      'image': 'assets/images/bank_accounts/nubank.png',
      'name': 'Nubank',
    },
    {
      'id': 52,
      'image': 'assets/images/bank_accounts/original.png',
      'name': 'Original',
    },
    {
      'id': 53,
      'image': 'assets/images/bank_accounts/pagbank.png',
      'name': 'PagBank',
    },
    {
      'id': 54,
      'image': 'assets/images/bank_accounts/patagonia.png',
      'name': 'Patagonia',
    },
    {
      'id': 55,
      'image': 'assets/images/bank_accounts/paypal.png',
      'name': 'Paypal',
    },
    {
      'id': 56,
      'image': 'assets/images/bank_accounts/payu.png',
      'name': 'PayU Brasil',
    },
    {
      'id': 57,
      'image': 'assets/images/bank_accounts/picpay.png',
      'name': 'PicPay',
    },
    {
      'id': 58,
      'image': 'assets/images/bank_accounts/porto_seguro.png',
      'name': 'Porto Seguro',
    },
    {
      'id': 59,
      'image': 'assets/images/bank_accounts/rico.png',
      'name': 'Rico',
    },
    {
      'id': 60,
      'image': 'assets/images/bank_accounts/safra.png',
      'name': 'Safra',
    },
    {
      'id': 61,
      'image': 'assets/images/bank_accounts/santander.png',
      'name': 'Santander',
    },
    {
      'id': 62,
      'image': 'assets/images/bank_accounts/sicredi.png',
      'name': 'Sicredi',
    },
    {
      'id': 62,
      'image': 'assets/images/bank_accounts/submarino.png',
      'name': 'Submarino',
    },
    {
      'id': 63,
      'image': 'assets/images/bank_accounts/superdigital.png',
      'name': 'Superdigital',
    },
    {
      'id': 64,
      'image': 'assets/images/bank_accounts/tesouro_direto.png',
      'name': 'Tesouro Direto',
    },
    {
      'id': 65,
      'image': 'assets/images/bank_accounts/tesouro_nacional.png',
      'name': 'Tesouro Nacional',
    },
    {
      'id': 66,
      'image': 'assets/images/bank_accounts/toro.png',
      'name': 'Toro Investimento',
    },
    {
      'id': 67,
      'image': 'assets/images/bank_accounts/trig.png',
      'name': 'Trigg',
    },
    {
      'id': 68,
      'image': 'assets/images/bank_accounts/unicred.png',
      'name': 'Unicred',
    },
    {
      'id': 69,
      'image': 'assets/images/bank_accounts/XP_Investimentos.png',
      'name': 'XP_investimentos',
    },
  ];
  String? selectedAccount;
  List<Map> day = [
    {
      'id': '1',
    },
    {
      'id': '2',
    },
    {
      'id': '3',
    },
    {
      'id': '4',
    },
    {
      'id': '5',
    },
    {
      'id': '6',
    },
    {
      'id': '7',
    },
    {
      'id': '8',
    },
    {
      'id': '9',
    },
    {
      'id': '10',
    },
    {
      'id': '11',
    },
    {
      'id': '12',
    },
    {
      'id': '13',
    },
    {
      'id': '14',
    },
    {
      'id': '15',
    },
    {
      'id': '16',
    },
    {
      'id': '17',
    },
    {
      'id': '18',
    },
    {
      'id': '19',
    },
    {
      'id': '20',
    },
    {
      'id': '21',
    },
    {
      'id': '22',
    },
    {
      'id': '23',
    },
    {
      'id': '24',
    },
    {
      'id': '25',
    },
    {
      'id': '26',
    },
    {
      'id': '27',
    },
    {
      'id': '28',
    },
    {
      'id': '29',
    },
    {
      'id': '30',
    },
  ];
  String? selectedDay;
  List<Map> cardFlags = [
    {
      'id': 0,
      'image': 'assets/images/credit_card_flags/visa.png',
      'name': 'Visa',
    },
    {
      'id': 1,
      'image': 'assets/images/credit_card_flags/mastercard.png',
      'name': 'Mastercard',
    },
    {
      'id': 2,
      'image': 'assets/images/credit_card_flags/american_express.png',
      'name': 'American Express',
    },
    {
      'id': 3,
      'image': 'assets/images/credit_card_flags/elo.png',
      'name': 'Elo',
    },
    {
      'id': 4,
      'image': 'assets/images/credit_card_flags/hipercard.png',
      'name': 'Hipercard',
    },
    {
      'id': 5,
      'image': 'assets/images/credit_card_flags/bndes.png',
      'name': 'BNDES',
    },
    {
      'id': 6,
      'image': 'assets/images/credit_card_flags/dinners.png',
      'name': 'Dinners',
    },
  ];
  String? selectedFlags;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget> [
              const SizedBox(
                height: 16.0,
              ),
              TextField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.dehaze),
                  labelText: 'Descrição',
                ),
                style: Theme.of(context).textTheme.bodyText1,
              ),
              const SizedBox(
                height: 16.0,
              ),
              const TextField(
                decoration: InputDecoration(
                  prefix: Text('R\$ '),
                  hintText: 'Limite',
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 16.0,
              ),
              DropdownButtonFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.view_array),
                  labelText: "Bandeira",
                ),
                value: selectedFlags,
                items: cardFlags.map((Map map) {
                  return DropdownMenuItem<String>(
                    value: map["id"].toString(),
                    child: Row(
                      children: <Widget>[
                        Image.asset(
                          map["image"],
                          width: 25,
                        ),
                        Container(
                            margin: const EdgeInsets.only(left: 10),
                            child: Text(map["name"],
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .tertiary,
                                ))),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (val) {},
              ),
              const SizedBox(
                height: 16.0,
              ),
              DropdownButtonFormField(
                decoration: const InputDecoration(
                  labelText: "Conta",
                ),
                value: selectedAccount,
                items: bankAccounts.map((Map map) {
                  return DropdownMenuItem<String>(
                    value: map["id"].toString(),
                    child: Row(
                      children: <Widget>[
                        Image.asset(
                          map["image"],
                          width: 25,
                        ),
                        Container(
                            margin: const EdgeInsets.only(left: 10),
                            child: Text(map["name"],
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .tertiary,
                                ))),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (val) {},
              ),
              const SizedBox(
                height: 16.0,
              ),
              DropdownButtonFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.calendar_today),
                  labelText: "Fechamento de Fatura",
                ),
                value: selectedDay,
                items: day.map((Map map) {
                  return DropdownMenuItem<String>(
                    value: map["id"].toString(),
                    child: Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: Text(map["id"],
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.tertiary,
                            ))),
                  );
                }).toList(),
                onChanged: (val) {},
              ),
              const SizedBox(
                height: 16.0,
              ),
              DropdownButtonFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.calendar_today),
                  labelText: "Vencimento de Fatura",
                ),
                value: selectedDay,
                items: day.map((Map map) {
                  return DropdownMenuItem<String>(
                    value: map["id"].toString(),
                    child: Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: Text(map["id"],
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.tertiary,
                            ))),
                  );
                }).toList(),
                onChanged: (val) {},
              ),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      widget.text,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.secondary),
                    )),
              ),
              const SizedBox(
                height: 16.0,
              ),
            ],
          ),
        ),
      ],
    );
  }
}